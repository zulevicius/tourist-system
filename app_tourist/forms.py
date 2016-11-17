from django import forms
from django.contrib.auth.models import User


class UserRegister(forms.ModelForm):

    password = forms.CharField(widget=forms.PasswordInput)

    class Meta:
        model = User
        fields = ['username', 'email', 'password']


class RemindPassword(forms.ModelForm):

    class Meta:
        model = User
        fields = ['email']