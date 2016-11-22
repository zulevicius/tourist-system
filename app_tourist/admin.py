from django.contrib import admin
from app_tourist.models import Image, Event, Place, Tour, TourObject, VisitPlace


class PlaceAdmin(admin.ModelAdmin):
    list_display = ['title', 'address', 'city']
    search_fields = ['title', 'address', 'city']

admin.site.register(Place, PlaceAdmin)


class TourObjectAdmin(admin.ModelAdmin):
    list_display = ['title' , 'place', 'ticket_price', 'last_update', 'link']
    search_fields = ['title', 'place', 'ticket_price', 'last_update', 'link']

admin.site.register(TourObject, TourObjectAdmin)


class VisitPlaceAdmin(admin.ModelAdmin):
    list_display = ['tour_object', 'always_available', 'is_museum', 'is_park_or_square', 'is_panorama',
                    'is_monument', 'is_church', 'is_palace', 'is_nature_object']
    search_fields = ['tour_object', 'always_available', 'is_museum', 'is_park_or_square', 'is_panorama',
                     'is_monument', 'is_church', 'is_palace', 'is_nature_object']

admin.site.register(VisitPlace, VisitPlaceAdmin)


class EventAdmin(admin.ModelAdmin):
    list_display = ['tour_object', 'is_concert', 'is_festival', 'is_exhibition']
    search_fields = ['tour_object', 'is_concert', 'is_festival', 'is_exhibition']

admin.site.register(Event, EventAdmin)


class ImageAdmin(admin.ModelAdmin):
    list_display = ['tour_object', 'image']
    search_fields = ['tour_object', 'image']

admin.site.register(Image, ImageAdmin)


class TourAdmin(admin.ModelAdmin):
    list_display = ['user', 'title']
    search_fields = ['user', 'title']

admin.site.register(Tour, TourAdmin)
