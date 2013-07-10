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
def price_file(name, site=None,lang=None):
    if not site:
        site='_'+Site.objects.get_current().site_cutting
    else:
        site='_'+site
    if not lang:
        lang='_'+get_language()
    elif lang=='default':
        lang=''
    else:
        lang='_'+lang

    name_with_lang=name+site+lang+'.pdf'
    prices_folder=urljoin(settings.MEDIA_URL, "files/generated_prices/")
    if path.isfile(path.join(Price.prices_path,name_with_lang)):
        return urljoin(prices_folder,name_with_lang)
    else:
        #todo all returns of no files links - normal 404
        return "404"



