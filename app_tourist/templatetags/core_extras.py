from django import template


register = template.Library()


@register.filter('class_type')
def class_type(ob):
    return ob.__class__.__name__
