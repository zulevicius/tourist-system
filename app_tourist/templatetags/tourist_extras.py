from django import template

from app_tourist.models import Event

register = template.Library()


@register.filter('is_midnight')
def is_midnight(time):
    if time.hour == 0 and time.minute == 0 and time.second == 0:
        return True
    return False


@register.filter('by_paragraphs')
def by_paragraphs(text):
    arr = []
    for line in text.splitlines():
        line = line.strip()
        if not line: continue
        arr.append(line)
    return arr


# v -> visit place
# e -> event
@register.filter('tour_object_type')
def tour_object_type(pk):

    try:
        Event.objects.get(tour_object__pk=pk)
        return "e"
    except: return "v"