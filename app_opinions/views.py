import datetime
import json

from django.contrib import messages
from django.contrib.auth.decorators import user_passes_test
from django.contrib.auth.models import User
from django.core.urlresolvers import reverse
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, redirect
from django.utils.decorators import method_decorator
from django.views.generic import ListView

from .forms import OpinionInputForm
from .models import Opinion, Vote
from app_tourist.models import TourObject


@user_passes_test(lambda u: u.is_superuser)
def delete_opinions(request):

    checks = request.POST.getlist("checks")
    opinions = Opinion.objects.filter(pk__in = checks)
    opinions.delete()

    messages.add_message(request, 25, 'Pasirinktos žinutės ištrintos', extra_tags="success")

    user_pk = request.POST.get('user_pk', -1)
    if user_pk != '':
        return redirect('app_opinions:user_opinions', pk=user_pk)

    return redirect('app_opinions:newest_opinions')


@user_passes_test(lambda u: u.is_superuser)
def change_users_activity(request, activeness):

    if activeness == "aktyvuoti":
        active = True
    else:
        active = False

    user_pk = request.POST.get('user_pk', -1)
    if user_pk != '':
        user = User.objects.get(pk = user_pk)
        user.is_active = active
        user.save()
        return redirect('app_opinions:user_opinions', pk=user_pk)

    checks = request.POST.getlist("checks")
    print(checks)
    opinions = Opinion.objects.filter(pk__in = checks)
    for opinion in opinions:
        user = opinion.user
        user.is_active = active
        user.save()

    return redirect('app_opinions:newest_opinions')


@user_passes_test(lambda u: u.is_superuser)
def user_opinions(request, pk):

    user = User.objects.get(pk = pk)
    opinionsList = Opinion.objects.filter(user = user).order_by("-date_posted")
    username = user.username
    user_pk = user.pk

    args = {'opinionsList': opinionsList, 'username': username, 'user_pk': user_pk}
    return render(request, 'app_opinions/newest_opinions.html', args)


class NewestOpinionsView(ListView):
    template_name = 'app_opinions/newest_opinions.html'
    model = Opinion

    @method_decorator(user_passes_test(lambda u: u.is_superuser))
    def dispatch(self, *args, **kwargs):
        return super(NewestOpinionsView, self).dispatch(*args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super(NewestOpinionsView, self).get_context_data()
        context['opinionsList'] = Opinion.objects.all().order_by("-date_posted")
        return context


def opinions_view(request, pk, order_by):

    if request.POST:
        tour_object = TourObject.objects.get(pk = pk)

        data = request.POST.copy()
        data['user'] = request.user.pk
        data['tour_object'] = tour_object.pk
        data['date_posted'] = datetime.datetime.now()
        form = OpinionInputForm(data)

        if form.is_valid():
            form.save()

        url = reverse('app_opinions:opinions', kwargs={'pk': pk, 'order_by': order_by})
        return HttpResponseRedirect(url)

    tour_object = TourObject.objects.get(pk = pk)
    opinionsList = Opinion.objects.filter(tour_object__pk=pk)
    votesList = Vote.objects.filter(opinion__in = opinionsList)
    form = OpinionInputForm()

    args = {'tour_object': tour_object, 'votesList': votesList, 'form': form, 'order_by': order_by}

    if order_by == 'naujausios':
        args['opinionsList'] = opinionsList.order_by("-date_posted")
    else:
        opinions = {}
        for opinion in opinionsList:
            opinionVotes = votesList.filter(opinion = opinion)
            opinions[str(opinion.pk)] = opinionVotes.filter(vote='1').count() - opinionVotes.filter(vote='0').count()

        sorted_opinions = None
        if order_by == 'geriausios':
            sorted_opinions = sorted(opinions.items(), key = lambda x: -x[1])
        elif order_by == 'blogiausios':
            sorted_opinions = sorted(opinions.items(), key = lambda x: x[1])

        sorted_opinions_array = []
        for opinion in sorted_opinions:
            sorted_opinions_array.append(opinionsList.get(pk = opinion[0]))
        args['opinionsList'] = sorted_opinions_array

    return render(request, 'app_opinions/opinions.html', args)


def vote_for_opinion(request):

    opinion_pk = int(request.GET['opinion'])
    vote = request.GET['vote']

    if not request.user.is_anonymous():
        opinion = Opinion.objects.get(pk = opinion_pk)
        try:
            vote = Vote(opinion=opinion, user=request.user, vote=vote)
            vote.save()
        except: pass

    return HttpResponse(json.dumps([]), content_type='application/json')
