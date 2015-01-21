from cms.plugins.inherit.forms import InheritForm
from cms.models import Page
from django.contrib.sites.models import Site
from django.utils.translation import ugettext_lazy as _
from eav.fields import EavSlugField
from django.db.models import CharField, ManyToManyField
from django.contrib.sites.admin import SiteAdmin
from django.conf import settings
from admin_tools.dashboard.modules import RecentActions
from django_geoip.models import CustomRegion
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

    
RecentActions.template = 'admin_tools_reimplement/dashboard/modules/recent_actions.html'
    
@monkeypatch_method(RecentActions)
def init_with_context(self, context):
    if self._initialized:
        return
    from django.db.models import Q
    from django.contrib.admin.models import LogEntry

    request = context['request']

    def get_qset(list):
        qset = None
        for contenttype in list:
            if isinstance(contenttype, ContentType):
                current_qset = Q(content_type__id=contenttype.id)
            else:
                try:
                    app_label, model = contenttype.split('.')
                except:
                    raise ValueError('Invalid contenttype: "%s"' % contenttype)
                current_qset = Q(
                    content_type__app_label=app_label,
                    content_type__model=model
                )
            if qset is None:
                qset = current_qset
            else:
                qset = qset | current_qset
        return qset

    if request.user is None or request.user.id == 1:
        qs = LogEntry.objects.all()
    else:
        qs = LogEntry.objects.filter(user__id__exact=request.user.id)

    if self.include_list:
        qs = qs.filter(get_qset(self.include_list))
    if self.exclude_list:
        qs = qs.exclude(get_qset(self.exclude_list))

    self.children = qs.select_related('content_type', 'user')[:self.limit]
    if not len(self.children):
        self.pre_content = _('No recent actions.')
    self._initialized = True

SiteAdmin.fieldsets=fieldsets = (
        (None, {
            'fields': ['domain', 'name', 'site_cutting','price_field_slugs', 'obl'] + ['country_'+lang[0] for lang in settings.LANGUAGES] + ['company_'+lang[0] for lang in settings.LANGUAGES]
        }),

        )
# add shortning to Site model. For auto selecting site-dependent information
Site.add_to_class('site_cutting', EavSlugField(_('Site cutting'),help_text=_("Short unique site identifier."), max_length=14, unique=True))
Site.add_to_class('price_field_slugs', CharField(_('Price field attrs'),help_text=_("Attributes of price fields for this site, separated with comma-space."), max_length=200))
Site.add_to_class('company', CharField(_('Site company'),help_text=_('Site company will show in header country-company selection'),max_length=70))
Site.add_to_class('country', CharField(_('Site country'),help_text=_('Site country will show in header country-company selection'),max_length=70))
Site.add_to_class('obl', ManyToManyField(CustomRegion, verbose_name=_("Choose if you want some areas to have their own domains"), blank=True))


#add cache info for pages
#from modifier import help_functions
#help_functions.cache_start_values()


#prints time of start
#TODO put in log?
from time import gmtime, strftime
print 'start time: ', strftime("%Y-%m-%d %H:%M:%S", gmtime())