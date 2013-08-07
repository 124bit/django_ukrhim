from cms.plugins.inherit.forms import InheritForm
from cms.models import Page
from django.contrib.sites.models import Site
from django.utils.translation import ugettext_lazy as _
from eav.fields import EavSlugField
from django.db.models import CharField
from django.contrib.sites.admin import SiteAdmin
from django.conf import settings
def monkeypatch_method(cls):
    '''
        @monkeypatch_method(class_to_patch)
        def patch_func(self, site):
            self.a="sda"
            return True
    '''

    def decorator(func):
        setattr(cls, func.__name__, func)
        return func
    return decorator



# override the page_link field in inherit_plugin to contain not only pages for
# current site
@monkeypatch_method(InheritForm)
def for_site(self, site):
    self.fields['from_page'].queryset = Page.objects.drafts().on_site(1)



SiteAdmin.fieldsets=fieldsets = (
        (None, {
            'fields': ['domain', 'name', 'site_cutting','price_field_slugs'] + ['country_'+lang[0] for lang in settings.LANGUAGES] + ['company_'+lang[0] for lang in settings.LANGUAGES]
        }),

        )
# add shortning to Site model. For auto selecting site-dependent information
Site.add_to_class('site_cutting', EavSlugField(_('Site cutting'),help_text=_("Short unique site identifier."), max_length=14, unique=True))
Site.add_to_class('price_field_slugs', CharField(_('Price field attrs'),help_text=_("Attributes of price fields for this site, separated with comma-space."), max_length=200))
Site.add_to_class('company', CharField(_('Site company'),help_text=_('Site company will show in header country-company selection'),max_length=70))
Site.add_to_class('country', CharField(_('Site country'),help_text=_('Site country will show in header country-company selection'),max_length=70))

#prints time of start
#TODO put in log?
from time import gmtime, strftime
print 'start time: ', strftime("%Y-%m-%d %H:%M:%S", gmtime())