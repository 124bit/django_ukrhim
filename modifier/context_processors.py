from django.contrib.sites.models import Site
from modifier import help_functions
def add_sites(request):
    context_extras = {}
    site=Site.objects.get_current()
    context_extras['site'] = site
    context_extras['site_cutting'] = site.site_cutting
    
    return context_extras
def add_for_cache_info(request):
    context_extras = {}
    
    try:
        context_extras['page_publish_dates']=help_functions.get_all_pages_date(request.current_page.site)
        context_extras['last_publish_date_all_pages']=help_functions.get_last_publish_date(request.current_page.site)
    except AttributeError:
        pass
    return context_extras 