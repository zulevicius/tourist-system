# -*- coding: utf-8 -*-

from django.conf.urls import url
from django.contrib.auth.decorators import login_required

from . import views

urlpatterns = [
    url(r'^$', views.to_index, name='root'),
    url(r'^pradzia/$', views.IndexView.as_view(), name='index'),

    url(r'^sukurti-miniaturas/$', views.generate_thumbnails, name='generate_thumbnails'),

    url(r'^lankytinos-vietos/$', views.VisitPlacesView.as_view(), name='visit_places'),
    url(r'^lankytina-vieta/perziureti/(?P<pk>\d+)/$', views.review_visitplace, name='review_visitplace'),
    url(r'^renginiai/$', views.EventsView.as_view(), name='events'),
    url(r'^renginiai/perziureti/(?P<pk>\d+)/$', views.review_event, name='review_event'),

    url(r'^adresu-tikrinimas/$', views.AddressCheckingView.as_view(), name='address_checking'),
    url(r'^redaguoti-adresa/$', views.edit_address, name='edit_address'),

    url(r'^mano-marsrutai/$', login_required(views.ToursListView.as_view()), name='my_tours'),
    url(r'^mano-marsrutai/perziureti/(?P<pk>\d+)/$', login_required(views.review_tour), name='review_tour'),
    url(r'^rekomenduojami-marsrutai/$', views.ToursListView.as_view(), name='recommended_tours'),
    url(r'^rekomenduojami/perziureti/(?P<pk>\d+)/$', views.review_tour, name='review_rec_tour'),

    url(r'^naujas-marsrutas/$', login_required(views.create_tour), name='create_tour'),
    url(r'^istrinti-marsruta/(?P<pk>\d+)/$', login_required(views.delete_tour), name='delete_tour'),
    url(r'^istrinti-objekta-is-marsruto-ir-peradresuoti/(?P<t_pk>\d+)/(?P<to_pk>\d+)$',
        login_required(views.remove_tour_object_from_tour_redirect), name='remove_object_from_tour_redirect'),

    url(r'^gauti-darbo-laika-pagal-sav-diena/$', views.get_working_hours_by_weekday, name='work_hours_by_weekday'),
    url(r'^prideti-objekta-i-marsruta/$', views.add_tour_object_to_tour, name='add_object_to_tour'),
    url(r'^istrinti-objekta-is-marsruto/$', views.remove_tour_object_from_tour, name='remove_object_from_tour'),
]


