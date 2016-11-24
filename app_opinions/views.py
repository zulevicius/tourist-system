import json

from django.contrib import messages
from django.core.urlresolvers import reverse
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, redirect
from django.views.generic import ListView, TemplateView

from .models import Opinion, Vote
from app_tourist.models import TourObject


class OpinionsView(ListView):
    template_name = 'app_opinions/opinions.html'
    model = Opinion

    def get_context_data(self, **kwargs):
        context = super(OpinionsView, self).get_context_data()

        optionsList = Opinion.objects.filter(tour_object = self.kwargs['pk']).order_by("-date_posted")
        context['tour_object'] = TourObject.objects.get(pk = self.kwargs['pk'])
        context['opinionsList'] = optionsList
        context['votesList'] = Vote.objects.filter(opinion__in = optionsList)

        return context


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
