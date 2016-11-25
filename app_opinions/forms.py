from captcha.fields import CaptchaField
from django import forms
from django.contrib.auth.models import User

from app_opinions.models import Opinion
from app_tourist.models import TourObject


class OpinionInputForm(forms.ModelForm):

    captcha = CaptchaField()

    # def __init__(self, *args, **kwargs):
    #
    #     user = User.objects.get(pk = kwargs.pop('user'))
    #     tour_object = TourObject.objects.get(pk=kwargs.pop('tour_object'))
    #
    #     self.user = user
    #     self.date_posted = kwargs.pop('date_posted')
    #     self.tour_object = tour_object
    #
    #     super(OpinionInputForm, self).__init__(*args, **kwargs)

    class Meta:
        model = Opinion
        fields = ['user', 'tour_object', 'comment', 'mark', 'date_posted']
