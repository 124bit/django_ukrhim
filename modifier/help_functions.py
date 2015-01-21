__author__ = 'Agafon'
import os
from modifier.cache_values import CacheValue
from cms.models.pagemodel import Page
from django.conf import settings
from django.core.cache import cache
from django.contrib.sites.models import Site
from os import path
from django.conf import settings
def url_to_path(url):
    return settings.PROJECT_PATH + url.replace('/', os.sep)
def path_to_url(path):
    pass
    
def set_all_pages_date(site):
    page_publish_dates={}
    pages=Page.objects.filter(site=site)
    for page in pages:
        page_publish_dates[page.pk]=page.last_publish_date
    cache.set(settings.PAGES_DATES_PREFIX+str(site.pk)+'_pages_dates',page_publish_dates,0)
    return page_publish_dates
        

def get_all_pages_date(site):
    get=cache.get(settings.PAGES_DATES_PREFIX+str(site.pk)+'_pages_dates')
    if get:
        return get
    else:
        return set_all_pages_date(site)

    
def set_last_publish_date(site,date=None):
    if date:
        res=date
    else:
        res=max(get_all_pages_date(site).values())
    cache.set(settings.PAGES_DATES_PREFIX+str(site.pk)+'_last_publish_date',res,0)
    return res
    

def get_last_publish_date(site):
    get=cache.get(settings.PAGES_DATES_PREFIX+str(site.pk)+'_last_publish_date')
    if get:
        return get
    else:
        return set_last_publish_date(site)
    
def cache_start_values():
    sites=Site.objects.all()
    for site in sites:
        set_all_pages_date(site)
        set_last_publish_date(site)

    
    
    