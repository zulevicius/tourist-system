# -*- coding: utf-8 -*-

from django.conf.urls import url
from django.contrib.auth.decorators import login_required

from . import views

urlpatterns = [
    url(r'^$', views.to_index, name='root'),
    url(r'^pradzia/$', views.IndexView.as_view(), name='index'),
    url(r'^registracija/$', views.UserRegisterView.as_view(), name='register'),
    url(r'^prisijungimas/$', views.UserLoginView.as_view(), name='login'),
    url(r'^atsijungti/$', views.logout_view, name='logout'),
    url(r'^pamirsau-slaptazodi/$', views.ForgotPasswordView.as_view(), name='forgot_password'),
    url(r'^keisti-slaptazodi/$', views.change_password, name='change_password'),

    # url(r'^nustatymai-terminai/$', login_required(views.rm_year_settings), name='rm_year_settings'),
]


