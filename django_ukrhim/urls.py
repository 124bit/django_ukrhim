from django.conf.urls import patterns, include, url

from django.contrib import admin
from django.conf import settings
admin.autodiscover()
import object_tools
from cms.sitemaps import CMSSitemap
from django.conf.urls.i18n import i18n_patterns

object_tools.autodiscover()
urlpatterns = i18n_patterns('',
                       url(r'^admin_tools/', include('admin_tools.urls')),
                       (r'^admin/', include(admin.site.urls)),

                       url(r'^elfinder/', include('elfinder.urls')),

                       url(r'^sitemap\.xml$', 'django.contrib.sitemaps.views.sitemap', {'sitemaps': {'cmspages': CMSSitemap}}),


#-------cms.urls must be last
                       url(r'^', include('cms.urls')),
                       )


if settings.DEBUG:
    urlpatterns = patterns('',

                           (r'^admin/', include('smuggler.urls')), # put it before admin url patterns

                           url(r'^media/(?P<path>.*)$', 'django.views.static.serve',
                               {'document_root': settings.MEDIA_ROOT, 'show_indexes': True}),
                           url(r'', include('django.contrib.staticfiles.urls')),
                           ) + urlpatterns







