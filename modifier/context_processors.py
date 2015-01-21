from django.contrib.sites.models import Site
from modifier import help_functions
def add_sites(request):
    context_extras = {}
    site=Site.objects.get_current()
    context_extras['site'] = site
    context_extras['site_cutting'] = site.site_cutting
    
    return context_extras
    
    
def location(request):
    context_extras = {}
    subdomain=request.META['HTTP_HOST']
    if subdomain[:4]=='www.':
        subdomain=subdomain[4:]
    if (subdomain[-6:]=='com.ua' and subdomain.count('.')>=3) or (subdomain[-6:]!='com.ua' and subdomain.count('.')>=2):
        subdomain=subdomain[:subdomain.find('.')]
    else:
        subdomain=''
    context_extras['subdomain']=subdomain
    if Site.objects.get_current().obl.count()>0:
        if subdomain:
            try:
                obl=Site.objects.get_current().obl.get(subdomain=subdomain)
                context_extras['loc']=obl.slug
            except:
                context_extras['loc']='default'
        
        else:
            if request.location and request.location.custom_region and  Site.objects.get_current().obl.filter(slug=request.location.custom_region.slug).exists():
                context_extras['loc']=request.location.custom_region.slug
            else:
                context_extras['loc']='default'
    else:
        if request.location and request.location.custom_region:
            context_extras['loc']=request.location.custom_region.slug
        else:
            context_extras['loc']='default'
    return context_extras
    
#not used    
def add_for_cache_info(request):
    context_extras = {}
    
    try:
        context_extras['page_publish_dates']=help_functions.get_all_pages_date(request.current_page.site)
        context_extras['last_publish_date_all_pages']=help_functions.get_last_publish_date(request.current_page.site)
    except AttributeError:
        pass
    return context_extras 