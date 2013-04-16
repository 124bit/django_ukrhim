__author__ = 'Agafon'
from django import template
from ..models import Price
from django.contrib.sites.models import Site
from django.utils.translation import get_language
from os import path
from django.conf import settings
from urlparse import urljoin

register = template.Library()
@register.simple_tag
def price_file(name, site='auto',lang='auto'):
    if site=='auto':
        site='_'+Site.objects.get_current().site_cutting
    else:
        site='_'+site
    if lang=='auto':
        lang='_'+get_language()
    else:
        lang='_'+lang

    name_with_lang=name+site+lang+'.pdf'
    name_without_lang=name+site+'.pdf'
    prices_folder=urljoin(settings.MEDIA_URL,'prices')


    if path.isfile(path.join(Price.prices_path,name_with_lang)):
        return urljoin(prices_folder,name_with_lang)
    elif path.isfile(path.join(Price.prices_path,name_without_lang)):
        return urljoin(prices_folder,name_with_lang)
    else:
        #todo all returns of no files links - normal 404
        return "404"



