# -*- coding: utf-8 -*-

from django.conf.urls import url
from django.contrib.auth.decorators import login_required

from . import views


urlpatterns = [
    url(r'^perziureti/(?P<pk>\d+)/$', views.opinions_view, name='opinions'),
    url(r'^balsuoti-uz-nuomone/$', login_required(views.vote_for_opinion), name='vote_for_opinion'),
]
