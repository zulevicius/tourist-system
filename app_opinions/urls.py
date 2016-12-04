# -*- coding: utf-8 -*-

from django.conf.urls import url
from django.contrib.auth.decorators import login_required

from . import views


urlpatterns = [
    url(r'^perziureti/(?P<pk>\d+)/(?P<order_by>[\w\-]+)/$', views.opinions_view, name='opinions'),
    url(r'^balsuoti-uz-nuomone/$', login_required(views.vote_for_opinion), name='vote_for_opinion'),
    url(r'^naujausios-nuomones/$', views.NewestOpinionsView.as_view(), name='newest_opinions'),
    url(r'^trinti-pasirinktas-nuomones/$', views.delete_opinions, name='delete_opinions'),
    url(r'^keisti-pasirinktu-naudotoju-aktyvuma/(?P<activeness>[\w\-]+)/$', views.change_users_activity,
        name='change_users_activity'),
    url(r'^naudotojo-nuomones/(?P<pk>\d+)/$', views.user_opinions, name='user_opinions'),
]
