import datetime
import pytz
from django import template


register = template.Library()


@register.filter('class_type')
def class_type(ob):
    return ob.__class__.__name__


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