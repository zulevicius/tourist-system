from app_tourist.models import TourObject

from django.contrib.auth.models import User
from django.db import models


MARK_TYPES = (
    ('0', 'Nepatiko'),
    ('1', 'Vidutiniškai'),
    ('2', 'Patiko')
)


VOTE_TYPES = (
    ('0', 'Blogai'),
    ('1', 'Gerai')
)


class Opinion(models.Model):

    user = models.ForeignKey(User, verbose_name="Naudotojas")
    tour_object = models.ForeignKey(TourObject)
    comment = models.TextField(max_length=5000, verbose_name="Komentaras")
    mark = models.CharField(choices=MARK_TYPES, max_length=1, verbose_name="Įvertinimas")
    date_posted = models.DateTimeField(verbose_name="Parašymo data")

    class Meta:
        verbose_name = "Nuomonė"
        verbose_name_plural = "Nuomonės"

    def __str__(self):
        return "%s, %s" % (self.user.username, self.tour_object.title)


class Vote(models.Model):

    user = models.ForeignKey(User, verbose_name="Naudotojas")
    opinion = models.ForeignKey(Opinion)
    vote = models.CharField(choices=VOTE_TYPES, max_length=1, verbose_name="Balsas")

    class Meta:
        verbose_name = "Balsas"
        verbose_name_plural = "Balsai"
        unique_together = ("user", "opinion")
