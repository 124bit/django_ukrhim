from django.contrib.sites.models import Site
def add_sites(request):

    context_extras = {}
    context_extras['sites'] =  Site.objects.all()
    context_extras['site'] = Site.objects.get_current()
    return context_extras
