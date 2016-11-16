# -*- coding: utf-8 -*-

from django.conf.urls import url
from django.contrib.auth.decorators import login_required

from . import views

urlpatterns = [
    # url(r'^prisijungti/$', views.UserLoginView.as_view(), name='login'),
    # url(r'^atsijungti/$', views.UserLogoutView.as_view(), name='logout'),
    url(r'^$', views.IndexView.as_view(), name='root'),
    url(r'^home/$', views.IndexView.as_view(), name='index'),

    # url(r'^nustatymai-terminai/$', login_required(views.rm_year_settings), name='rm_year_settings'),
]


