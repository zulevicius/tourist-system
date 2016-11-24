from captcha.fields import CaptchaField
from django import forms
from django.contrib.auth.models import User


class UserRegisterForm(forms.ModelForm):

    password = forms.CharField(widget=forms.PasswordInput)
    captcha = CaptchaField()

    def clean_password(self):
        password = self.cleaned_data['password']
        if len(password) < 8:
            raise forms.ValidationError("Slaptažodžio ilgis turi viršyti 7 simbolius")
        elif self.data['psw2'] != password:
            raise forms.ValidationError("Slaptažodžiai nesutampa")
        else:
            return password

    class Meta:
        model = User
        fields = ['username', 'email', 'password']


class RemindPasswordForm(forms.ModelForm):

    captcha = CaptchaField()

    class Meta:
        model = User
        fields = ['email']