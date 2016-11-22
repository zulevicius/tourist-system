# -*- coding: utf-8 -*-

from django.conf.urls import url
from django.contrib.auth.decorators import login_required

from . import views

urlpatterns = [
    url(r'^$', views.to_index, name='root'),
    url(r'^pradzia/$', views.IndexView.as_view(), name='index'),

    url(r'^lankytinos-vietos/$', views.VisitPlacesView.as_view(), name='visit_places'),
    url(r'^perziureti-lankytina-vieta/(?P<pk>\d+)/$', views.review_visitplace, name='review_visitplace'),
    url(r'^renginiai/$', views.EventsView.as_view(), name='events'),
    url(r'^perziureti-rengini/(?P<pk>\d+)/$', views.review_event, name='review_event'),

    url(r'^mano-marsrutai/$', login_required(views.MyToursView.as_view()), name='my_tours'),
    url(r'^naujas-marsrutas/$', login_required(views.create_tour), name='create_tour'),
    url(r'^istrinti-marsruta/(?P<pk>\d+)/$', login_required(views.delete_tour), name='delete_tour'),

    url(r'^gauti-darbo-laika-pagal-sav-diena/$', views.get_working_hours_by_weekday, name='work_hours_by_weekday'),
    url(r'^prideti-objekta-i-marsruta/$', views.add_tour_object_to_tour, name='add_object_to_tour'),
    url(r'^istrinti-objekta-is-marsruto/$', views.remove_tour_object_from_tour, name='remove_object_from_tour'),


    # url(r'^nustatymai-terminai/$', login_required(views.rm_year_settings), name='rm_year_settings'),
]


