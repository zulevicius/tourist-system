# -*- coding: utf-8 -*-
import datetime
import json

from django.contrib import messages
from django.contrib.auth.decorators import user_passes_test
from django.core.urlresolvers import resolve, reverse
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, redirect
from django.utils import timezone
from django.utils.decorators import method_decorator
from django.views.generic import ListView, TemplateView
from sorl.thumbnail import get_thumbnail

from app_opinions.models import Opinion
from app_tourist.models import Event, Image, Tour, TourObject, VisitPlace


class AddressCheckingView(ListView):

    template_name = 'app_tourist/address_checking.html'
    model = TourObject

    @method_decorator(user_passes_test(lambda u: u.is_superuser))
    def dispatch(self, *args, **kwargs):
        return super(AddressCheckingView, self).dispatch(*args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super(AddressCheckingView, self).get_context_data()
        context['tourObjectsList'] = TourObject.objects.all()
        return context


def edit_address(request):

    tour_object_pk = request.GET['tour_object_pk']
    place_title = request.GET['place']
    address = request.GET['address']
    city = request.GET['city']
    area_code = request.GET['code'].strip()
    if area_code == "":
        area_code = None

    place = TourObject.objects.get(pk = tour_object_pk).place
    place.title = place_title
    place.address = address
    place.city = city
    place.area_code = area_code
    place.save()

    result = "success"

    return HttpResponse(json.dumps(result), content_type='application/json')


def review_tour(request, pk):

    tour = Tour.objects.get(pk = pk)

    url = resolve(request.path_info).url_name
    if tour.user != request.user and url == 'review_tour':
        return redirect('app_tourist:index')

    args = {'tour': tour}
    if url == 'review_tour':
        args['mine'] = True

    return render(request, 'app_tourist/review_tour.html', args)


class ToursListView(ListView):
    template_name = 'app_tourist/tours_list.html'
    model = Tour

    def get_context_data(self, **kwargs):
        context = super(ToursListView, self).get_context_data()

        url = resolve(self.request.path_info).url_name
        if url == 'my_tours':
            context['toursList'] = Tour.objects.filter(user = self.request.user)
            context['mine'] = True
        elif url == 'recommended_tours':
            context['toursList'] = Tour.objects.filter(user=None)

        return context


def create_tour(request):

    if request.user.is_anonymous():
        redirect('app_tourist:index')

    if Tour.objects.filter(user = request.user).count() >= 7:
        messages.add_message(request, 25, 'Galima turėti ne daugiau nei 7 marštutus', extra_tags="danger")
    else:
        title = request.POST['tour_name']
        tour = Tour(title = title, user=request.user)
        tour.save()

        messages.add_message(request, 25, 'Maršrutas %s sukurtas' % title, extra_tags="success")

    url = reverse('app_tourist:my_tours')
    return HttpResponseRedirect(url)


def delete_tour(request, pk):

    tour = Tour.objects.get(pk = pk)
    title = tour.title
    if tour.user == request.user:
        tour.delete()

    messages.add_message(request, 25, 'Maršrutas %s ištrintas' % title, extra_tags="success")

    url = reverse('app_tourist:my_tours')
    return HttpResponseRedirect(url)


class VisitPlacesView(ListView):
    template_name = 'app_tourist/visitplaces.html'
    model = VisitPlace

    def get_context_data(self, **kwargs):
        context = super(VisitPlacesView, self).get_context_data()
        visit_places = VisitPlace.objects.all()
        context['visitPlacesList'] = visit_places
        return context


def review_visitplace(request, pk):

    vp = VisitPlace.objects.get(pk = pk)
    events = Event.objects.filter(tour_object__place=vp.tour_object.place, event_end_date__gte=datetime.datetime.now())
    images = Image.objects.filter(tour_object=vp.tour_object)
    opinions_count = Opinion.objects.filter(tour_object = vp.tour_object).count()

    tours = None
    if not request.user.is_anonymous():
        tours = []
        for t in Tour.objects.filter(user = request.user):
            if vp.tour_object not in t.tour_objects.all():
                tours.append(t)

    args = {'visit_place': vp, 'events': events, 'images': images, 'tours': tours, 'opinions_count': opinions_count}

    return render(request, 'app_tourist/review_visitplace.html', args)


class EventsView(ListView):
    template_name = 'app_tourist/events.html'
    model = Event

    def get_context_data(self, **kwargs):
        context = super(EventsView, self).get_context_data()
        context['eventsList'] = Event.objects.filter(event_end_date__gte = datetime.datetime.now())
        return context


def review_event(request, pk):

    ev = Event.objects.get(pk = pk)
    if ev.event_end_date < timezone.now():
        messages.add_message(request, 25, ('%s jau praėjo' % ev.tour_object.title), extra_tags="danger")
        redirect('app_tourist:events')

    images = Image.objects.filter(tour_object=ev.tour_object)
    opinions_count = Opinion.objects.filter(tour_object=ev.tour_object).count()

    tours = None
    if not request.user.is_anonymous():
        tours = []
        for t in Tour.objects.filter(user = request.user):
            if ev.tour_object not in t.tour_objects.all():
                tours.append(t)

    args = {'event': ev, 'images': images, 'tours': tours, 'opinions_count': opinions_count}

    return render(request, 'app_tourist/review_event.html', args)


def add_tour_object_to_tour(request):

    tour_pk = int(request.GET['tour_pk'])
    tour_object_pk = int(request.GET['tour_object_pk'])
    tour = Tour.objects.get(pk = tour_pk)
    tour_object = TourObject.objects.get(pk = tour_object_pk)

    if tour.user == request.user:
        tour.tour_objects.add(tour_object)
        tour.save()

    result = []
    for t in Tour.objects.filter(user = request.user):
        if tour_object not in t.tour_objects.all():
            result.append({t.pk: t.title})

    return HttpResponse(json.dumps(result), content_type='application/json')


def remove_tour_object_from_tour(request):

    tour_pk = int(request.GET['tour_pk'])
    tour_object_pk = int(request.GET['tour_object_pk'])
    tour = Tour.objects.get(pk=tour_pk)
    tour_object = TourObject.objects.get(pk = tour_object_pk)

    if tour.user == request.user:
        tour.tour_objects.remove(tour_object)

    return HttpResponse(json.dumps([]), content_type='application/json')


def remove_tour_object_from_tour_redirect(request, t_pk, to_pk):

    tour = Tour.objects.get(pk=t_pk)
    tour_object = TourObject.objects.get(pk = to_pk)

    if tour.user == request.user:
        tour.tour_objects.remove(tour_object)
    else: return redirect("app_tourist:index")

    return redirect("app_tourist:review_tour", pk=t_pk)


def get_working_hours_by_weekday(request):

    pk = int(request.GET['pk'])
    weekday = int(request.GET['weekday'])

    result = [('pk', pk)]
    vp = VisitPlace.objects.get(pk = pk)

    if vp.always_available:
        result.append(('start', "always"))
    elif weekday == 0:
        result.append(('start', str(vp.mondayWorkingHoursStart)))
        result.append(('end', str(vp.mondayWorkingHoursEnd)))
    elif weekday == 1:
        result.append(('start', str(vp.tuesdayWorkingHoursStart)))
        result.append(('end', str(vp.tuesdayWorkingHoursEnd)))
    elif weekday == 2:
        result.append(('start', str(vp.wednesdayWorkingHoursStart)))
        result.append(('end', str(vp.wednesdayWorkingHoursEnd)))
    elif weekday == 3:
        result.append(('start', str(vp.thursdayWorkingHoursStart)))
        result.append(('end', str(vp.thursdayWorkingHoursEnd)))
    elif weekday == 4:
        result.append(('start', str(vp.fridayWorkingHoursStart)))
        result.append(('end', str(vp.fridayWorkingHoursEnd)))
    elif weekday == 5:
        result.append(('start', str(vp.saturdayWorkingHoursStart)))
        result.append(('end', str(vp.saturdayWorkingHoursEnd)))
    elif weekday == 6:
        result.append(('start', str(vp.sundayWorkingHoursStart)))
        result.append(('end', str(vp.sundayWorkingHoursEnd)))

    return HttpResponse(json.dumps(result), content_type='application/json')


def to_index(request):
    return redirect('app_tourist:index')


class IndexView(TemplateView):
    template_name = 'app_tourist/index.html'

    def get_context_data(self):
        context = super(IndexView, self).get_context_data()
        context['visit_places_count'] = VisitPlace.objects.count()
        context['events_count'] = Event.objects.count()
        context['recommended_tours_count'] = Tour.objects.filter(user = None).count()
        return context


@user_passes_test(lambda u: u.is_superuser)
def generate_thumbnails(request):

    for t in TourObject.objects.all():
        width = (130 / t.main_photo.height) * t.main_photo.width
        dimensions = str(int(width)) + 'x130'
        t.thumbnail = get_thumbnail(t.main_photo, dimensions, quality=99, format='JPEG').url
        print(get_thumbnail(t.main_photo, dimensions, quality=99, format='JPEG').url)
        t.save()

    return redirect('app_tourist:index')
