from django.contrib.auth.models import User
from django.db import models


class Place(models.Model):

    title = models.CharField(max_length=50, verbose_name="Pavadinimas", blank=True, null=True)
    address = models.CharField(max_length=64, verbose_name="Adresas")
    city = models.CharField(max_length=30, verbose_name="Miestas")

    class Meta:
        verbose_name = "Vieta"
        verbose_name_plural = "Vietos"

    def __str__(self):
        return "%s | %s" % (self.title, self.address)


class TourObject(models.Model):

    title = models.CharField(max_length=100, verbose_name="Pavadinimas")
    place = models.ForeignKey(Place, verbose_name="Vietovė")
    ticket_price = models.FloatField(verbose_name="Didžiausia bilieto kaina")

    last_update = models.DateTimeField(verbose_name="Paskutinis atnaujinimas")
    link = models.CharField(max_length=200, blank=True, null=True, verbose_name="Oficialus puslapis")
    extra_info = models.TextField(blank=True, null=True, verbose_name="Papildoma informacija")
    main_photo = models.ImageField(verbose_name="Pagrindinė nuotrauka", blank=True, null=True)

    class Meta:
        verbose_name = "Turistinis objektas"
        verbose_name_plural = "Turistiniai objektai"

    def __str__(self):
        try:
            if self.visitplace:
                return "%s (Priskirtas)" % self.title
        except: pass

        try:
            if self.event:
                return "%s (Priskirtas)" % self.title
        except: pass

        return self.title


class VisitPlace(models.Model):

    tour_object = models.OneToOneField(TourObject, on_delete=models.CASCADE, primary_key=True)

    always_available = models.BooleanField(default=False, verbose_name="Prieinama visuomet")

    mondayWorkingHoursStart = models.TimeField(blank=True, null=True, verbose_name="Pirmadienio darbo pradžia")
    mondayWorkingHoursEnd = models.TimeField(blank=True, null=True, verbose_name="Pirmadienio darbo pabaiga")

    tuesdayWorkingHoursStart = models.TimeField(blank=True, null=True, verbose_name="Antradienio darbo pradžia")
    tuesdayWorkingHoursEnd = models.TimeField(blank=True, null=True, verbose_name="Antradienio darbo pabaiga")

    wednesdayWorkingHoursStart = models.TimeField(blank=True, null=True, verbose_name="Trečiadienio darbo pradžia")
    wednesdayWorkingHoursEnd = models.TimeField(blank=True, null=True, verbose_name="Trečiadienio darbo pabaiga")

    thursdayWorkingHoursStart = models.TimeField(blank=True, null=True, verbose_name="Ketvirtadienio darbo pradžia")
    thursdayWorkingHoursEnd = models.TimeField(blank=True, null=True, verbose_name="Ketvirtadienio darbo pabaiga")

    fridayWorkingHoursStart = models.TimeField(blank=True, null=True, verbose_name="Penktadienio darbo pradžia")
    fridayWorkingHoursEnd = models.TimeField(blank=True, null=True, verbose_name="Penktadienio darbo pabaiga")

    saturdayWorkingHoursStart = models.TimeField(blank=True, null=True, verbose_name="Šeštadienio darbo pradžia")
    saturdayWorkingHoursEnd = models.TimeField(blank=True, null=True, verbose_name="Šeštadienio darbo pabaiga")

    sundayWorkingHoursStart = models.TimeField(blank=True, null=True, verbose_name="Sekmadienio darbo pradžia")
    sundayWorkingHoursEnd = models.TimeField(blank=True, null=True, verbose_name="Sekmadienio darbo pabaiga")

    is_museum = models.BooleanField(default=False, verbose_name="Muziejus")
    is_park_or_square = models.BooleanField(default=False, verbose_name="Parkas / Aikštė")
    is_panorama = models.BooleanField(default=False, verbose_name="Panorama")
    is_monument = models.BooleanField(default=False, verbose_name="Istorinis paminklas")
    is_church = models.BooleanField(default=False, verbose_name="Bažnyčia")
    is_palace = models.BooleanField(default=False, verbose_name="Dvaras / Pilis")
    is_nature_object = models.BooleanField(default=False, verbose_name="Gamtos objektas")

    class Meta:
        verbose_name = "Lankytina vieta"
        verbose_name_plural = "Lankytinos vietos"


class Event(models.Model):

    tour_object = models.OneToOneField(TourObject, on_delete=models.CASCADE, primary_key=True)
    event_date = models.DateTimeField(verbose_name="Renginio data")
    event_end_date = models.DateTimeField(verbose_name="Renginio pabaiga")

    min_ticket_price = models.FloatField(blank=True, null=True, verbose_name="Mažiausia bilieto kaina")

    is_concert = models.BooleanField(default=False, verbose_name="Koncertas")
    is_festival = models.BooleanField(default=False, verbose_name="Masinė kultūros šventė")
    is_exhibition = models.BooleanField(default=False, verbose_name="Paroda")

    class Meta:
        verbose_name = "Renginys"
        verbose_name_plural = "Renginiai"


class Image(models.Model):

    tour_object = models.ForeignKey(TourObject, verbose_name="Turistinis objektas")
    image = models.ImageField(verbose_name="Paveiksliukas", blank=True, null=True)

    class Meta:
        verbose_name = "Paveikslėlis"
        verbose_name_plural = "Paveikslėliai"


class Tour(models.Model):

    title = models.CharField(max_length=50, verbose_name="Pavadinimas")
    user = models.ForeignKey(User, verbose_name="Naudotojas")
    tour_objects = models.ManyToManyField(TourObject, verbose_name="Objektai")

    class Meta:
        verbose_name = "Maršrutas"
        verbose_name_plural = "Maršrutai"

    def __str__(self):
        return self.title