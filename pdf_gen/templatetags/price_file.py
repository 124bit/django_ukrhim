__author__ = 'Agafon'
from django import template
from ..models import Price
from django.contrib.sites.models import Site
from django.utils.translation import get_language
from os import path
from django.conf import settings
from urlparse import urljoin
from django.http import Http404
from django.utils.translation import ugettext as _
import os
register = template.Library()
@register.assignment_tag()
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
    prices_folder=settings.MEDIA_ROOT + "/files/generated_prices/"
    prices_url=urljoin(settings.MEDIA_URL, "files/generated_prices/")
    
    time=Price.objects.get(name=name).get_update_time()
    if time!=_("price list never generated"):
        time=time.strftime('%s')
    if path.isfile(path.join(Price.prices_path,name_with_lang)):
        return urljoin(prices_url,name_with_lang)+'?date='+time, os.path.getsize(path.join(Price.prices_path,name_with_lang))/1024
    else:

        return "404",'0'



