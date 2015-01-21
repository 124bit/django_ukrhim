__author__ = 'Agafon'
from django import template
from django.contrib.sites.models import Site
from eav.models import Attribute
from django.core.exceptions import ObjectDoesNotExist
from django.utils.translation import ugettext as _
register = template.Library()
@register.simple_tag
def currency(site=None, price_index=None,price_slug=None, upper = False, lang=None):
    '''receive currency of current site price field by tag  {{ currency }}'''
    if not price_slug:
            if site:
                if price_index:
                    price_slug=Site.objects.get(site_cutting=site).price_field_slugs.split(', ')[price_index]
                else:
                    price_slug=Site.objects.get(site_cutting=site).price_field_slugs.split(', ')[0]
            else:
                if price_index:
                    price_slug=Site.objects.get_current().price_field_slugs.split(', ')[price_index]
                else:
                    price_slug=Site.objects.get_current().price_field_slugs.split(', ')[0]

    #todo check for safety return this and all
    try:
        price_field=Attribute.objects.get(slug=price_slug)
        if lang and lang!='default':
            units_slug='units_'+lang
        else:
            units_slug='units'
        curr=getattr(price_field, units_slug) 
        if upper:
            return curr.upper()
        else:
            return curr
    except KeyError:
        return ''
    except ObjectDoesNotExist:
        return ''
