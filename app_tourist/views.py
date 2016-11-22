# -*- coding: utf-8 -*-
import datetime
import json

from django.contrib import messages
from django.core.urlresolvers import reverse
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, redirect
from django.views.generic import ListView, TemplateView

from app_tourist.models import Event, Image, Tour, TourObject, VisitPlace


class MyToursView(ListView):
    template_name = 'app_tourist/my_tours.html'
    model = Tour

    def get_context_data(self, **kwargs):
        context = super(MyToursView, self).get_context_data()
        context['myToursList'] = Tour.objects.filter(user = self.request.user)

        return context


def create_tour(request):

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
        context['visitPlacesList'] = VisitPlace.objects.all()
        return context


def review_visitplace(request, pk):

    vp = VisitPlace.objects.get(pk = pk)
    events = Event.objects.filter(tour_object__place=vp.tour_object.place, event_date__gte=datetime.datetime.now())
    images = Image.objects.filter(tour_object=vp.tour_object)

    tours = None
    if not request.user.is_anonymous():
        tours = []
        for t in Tour.objects.filter(user = request.user):
            if vp.tour_object not in t.tour_objects.all():
                tours.append(t)

    args = {'visit_place': vp, 'events': events, 'images': images, 'tours': tours}

    return render(request, 'app_tourist/review_visitplace.html', args)


class EventsView(ListView):
    template_name = 'app_tourist/events.html'
    model = Event

    def get_context_data(self, **kwargs):
        context = super(EventsView, self).get_context_data()
        context['eventsList'] = Event.objects.all()
        return context


def review_event(request, pk):

    ev = Event.objects.get(pk = pk)
    images = Image.objects.filter(tour_object=ev.tour_object)

    tours = None
    if not request.user.is_anonymous():
        tours = []
        for t in Tour.objects.filter(user = request.user):
            if ev.tour_object not in t.tour_objects.all():
                tours.append(t)

    args = {'event': ev, 'images': images, 'tours': tours}

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

        return context
