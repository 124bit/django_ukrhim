__author__ = 'Agafon'
from django import template
from django.contrib.sites.models import Site
from eav.models import Attribute
from django.core.exceptions import ObjectDoesNotExist
from django.utils.translation import ugettext as _
register = template.Library()
@register.simple_tag
def currency():
    '''receive currency of current site price field by tag  {{ currency }}'''
    price_slug=Site.objects.get_current().price_field_slug
    #todo check for safety return this and all
    try:
        price_field=Attribute.objects.get(slug=price_slug)
        curr=price_field.options['price_field']['currency']
        return _(curr)
    except KeyError:
        return ''
    except ObjectDoesNotExist:
        return ''
