# -*- coding: utf-8 -*-

from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^registracija/$', views.UserRegisterView.as_view(), name='register'),
    url(r'^prisijungimas/$', views.UserLoginView.as_view(), name='login'),
    url(r'^atsijungti/$', views.logout_view, name='logout'),
    url(r'^pamirsau-slaptazodi/$', views.ForgotPasswordView.as_view(), name='forgot_password'),
    url(r'^keisti-slaptazodi/$', views.change_password, name='change_password'),
]


