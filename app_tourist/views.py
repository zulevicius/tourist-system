# -*- coding: utf-8 -*-
import datetime
import json

from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.contrib.auth.forms import AuthenticationForm
from django.core.mail import EmailMessage
from django.core.urlresolvers import reverse
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, redirect
from django.utils.crypto import get_random_string
from django.views.generic import FormView, ListView, TemplateView, View

from .forms import RemindPassword, UserRegister
from app_tourist.models import Event, Image, VisitPlace


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

    args = {'visit_place': vp, 'events': events, 'images': images}

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

    args = {'event': ev, 'images': images}

    return render(request, 'app_tourist/review_event.html', args)


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


class UserRegisterView(View):

    form_class = UserRegister
    template_name = 'app_tourist/register.html'

    def get(self, request):
        form = self.form_class(None)
        return render(request, self.template_name, {'form': form})

    def post(self, request):
        form = self.form_class(request.POST)

        if form.is_valid():

            # clean (normalize) data
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']

            # if password != request.POST['psw2']:
            #     messages.add_message(self.request, 25, 'Slaptažodžiai nesutampa', extra_tags="danger")
            # else:
            user = form.save(commit=False)
            user.set_password(password)
            user.save()

            return redirect('app_tourist:login')

        return render(request, self.template_name, {'form': form})


class UserLoginView(FormView):

    form_class = AuthenticationForm
    template_name = 'app_tourist/login.html'

    def get(self, request, *args, **kwargs):
        if request.user.is_authenticated():
            return redirect('app_tourist:index')
        else:
            return super(UserLoginView, self).get(request)

    def get_success_url(self):
        url = reverse('app_tourist:index', kwargs={})
        return url

    def form_invalid(self, form):
        messages.add_message(self.request, 25, 'Neteisingi prisijungimo duomenys', extra_tags="danger")
        return self.render_to_response(self.get_context_data(form=form))

    def form_valid(self, form):
        user = form.get_user()
        if user:
            if user.is_active:
                login(self.request, form.get_user())
                return HttpResponseRedirect(self.get_success_url())
            else:
                messages.add_message(self.request, 25, 'Prisijungimas uždraustas', extra_tags="danger")
                return self.render_to_response(self.get_context_data(form=form))


def logout_view(request):
    logout(request)
    return redirect('app_tourist:index')


class ForgotPasswordView(View):

    form_class = RemindPassword
    template_name = 'app_tourist/forgot_password.html'

    def get(self, request):
        form = self.form_class(None)
        return render(request, self.template_name, {'form': form})

    def post(self, request):
        form = self.form_class(request.POST)

        if form.is_valid():
            email = form.cleaned_data['email']

            user_results = User.objects.filter(email=email)
            if user_results.count() > 0:
                new_psw = get_random_string(length=16)
                user = user_results.first()
                user.set_password(new_psw)
                user.save()

                message = ("Naudotojo vardas: %s\nNaujas slaptažodis: %s" % (user.username, new_psw))
                email_msg = EmailMessage('Naujas slaptažodis', message, to=[email])
                email_msg.send()

                messages.add_message(request, 25, "Naujas slaptažodis išsiųstas", extra_tags="success")
                return redirect('app_tourist:login')

        messages.add_message(request, 25, "Nerasta paskyra su tokiu el. pašto adresu", extra_tags="danger")
        return render(request, self.template_name, {'form': form})


def change_password(request):

    if request.POST:
        old_psw = request.POST['old_psw']
        new_psw = request.POST['new_psw']
        new_psw2 = request.POST['new_psw2']

        user = User.objects.get(pk = request.user.pk)

        if user.check_password(old_psw):
            if new_psw == new_psw2:
                if len(new_psw) > 7:
                    user.set_password(new_psw)
                    user.save()

                    messages.add_message(request, 25, "Slaptažodis pakeistas. Prisijunkite iš naujo",
                                         extra_tags="success")
                    return redirect('app_tourist:index')
                else:
                    messages.add_message(request, 25, "Slaptažodžio ilgis turi viršyti 7 simbolius",
                                         extra_tags="danger")
            else:
                messages.add_message(request, 25, "Nauji slaptažodžiai nesutampa", extra_tags="danger")
        else:
            messages.add_message(request, 25, "Senas slaptažodis įvestas klaidingai", extra_tags="danger")

    return render(request, 'app_tourist/change_password.html')
