import datetime
import json

from django.contrib import messages
from django.core.urlresolvers import reverse
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, redirect
from django.views.generic import ListView, TemplateView

from .forms import OpinionInputForm
from .models import Opinion, Vote
from app_tourist.models import TourObject


def opinions_view(request, pk):

    if request.POST:
        tour_object = TourObject.objects.get(pk = pk)
        # opinionsList = Opinion.objects.filter(tour_object__pk=pk).order_by("-date_posted")
        # votesList = Vote.objects.filter(opinion__in=opinionsList)

        data = request.POST.copy()
        data['user'] = request.user.pk
        data['tour_object'] = tour_object.pk
        data['date_posted'] = datetime.datetime.now()
        form = OpinionInputForm(data)

        if form.is_valid():
            form.save()

        url = reverse('app_opinions:opinions', kwargs={'pk': pk})
        return HttpResponseRedirect(url)

    tour_object = TourObject.objects.get(pk = pk)
    opinionsList = Opinion.objects.filter(tour_object__pk = pk).order_by("-date_posted")

    votesList = Vote.objects.filter(opinion__in = opinionsList)
    form = OpinionInputForm()

    args = {'tour_object': tour_object, 'opinionsList': opinionsList, 'votesList': votesList, 'form': form}
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
