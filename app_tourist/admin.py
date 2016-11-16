from django.contrib import admin
from app_tourist.models import Image, Event, Place, TourObject, VisitPlace


class PlaceAdmin(admin.ModelAdmin):
    list_display = ['title', 'x', 'y', 'address']
    search_fields = ['title', 'x', 'y', 'address']

admin.site.register(Place, PlaceAdmin)


class TourObjectAdmin(admin.ModelAdmin):
    list_display = ['title', 'place', 'ticket_price', 'last_update', 'link', 'extra_info']
    search_fields = ['title', 'place', 'ticket_price', 'last_update', 'link', 'extra_info']

admin.site.register(TourObject, TourObjectAdmin)


class VisitPlaceAdmin(admin.ModelAdmin):
    list_display = ['tour_object', 'always_available', 'is_museum', 'is_park_or_square', 'is_famous_place',
                    'is_monument', 'is_palace', 'is_nature_object']
    search_fields = ['tour_object', 'always_available', 'is_museum', 'is_park_or_square', 'is_famous_place',
                     'is_monument', 'is_palace', 'is_nature_object']

admin.site.register(VisitPlace, VisitPlaceAdmin)


class EventAdmin(admin.ModelAdmin):
    list_display = ['tour_object', 'is_concert', 'is_festival', 'is_exhibition']
    search_fields = ['tour_object', 'is_concert', 'is_festival', 'is_exhibition']

admin.site.register(Event, EventAdmin)


class ImageAdmin(admin.ModelAdmin):
    list_display = ['tour_object', 'filename']
    search_fields = ['tour_object', 'filename']

admin.site.register(Image, ImageAdmin)
