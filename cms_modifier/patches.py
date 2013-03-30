from cms.plugins.inherit.forms import InheritForm
from cms.models import Page
from django.contrib.sites.models import Site
from django.db import models
from django.utils.translation import ugettext_lazy as _


def monkeypatch_method(cls):
    def decorator(func):
        setattr(cls, func.__name__, func)
        return func
    return decorator



# override the page_link field in inherit_plugin to containt not only pages for
# current site
@monkeypatch_method(InheritForm)
def for_site(self, site):
    self.fields['from_page'].queryset = Page.objects.drafts().on_site(1)

# add shortning to Site model
Site.add_to_class('cutting', models.CharField(_('cutting'), max_length=50))

