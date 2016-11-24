from app_opinions.models import Opinion, Vote
from django.contrib import admin


class OpinionAdmin(admin.ModelAdmin):
    list_display = ['user', 'tour_object', 'comment', 'mark', 'date_posted']
    search_fields = ['user', 'tour_object', 'comment', 'mark', 'date_posted']

admin.site.register(Opinion, OpinionAdmin)


class VoteAdmin(admin.ModelAdmin):
    list_display = ['user', 'opinion', 'vote']
    search_fields = ['user', 'opinion', 'vote']

admin.site.register(Vote, VoteAdmin)