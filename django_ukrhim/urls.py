from django.conf.urls import patterns, include, url

from django.contrib import admin
from django.conf import settings
admin.autodiscover()
import object_tools
from cms.sitemaps import CMSSitemap
from solid_i18n.urls import solid_i18n_patterns
object_tools.autodiscover()

handler404 = 'site_utils.handler404'
handler500 = 'site_utils.handler500'

urlpatterns = solid_i18n_patterns('',
                       url(r'^admin_tools/', include('admin_tools.urls')),
                       url(r'^admin/', include(admin.site.urls)),

                       url(r'^elfinder/', include('elfinder.urls')),

                       url(r'^sitemap\.xml$', 'django.contrib.sitemaps.views.sitemap', {'sitemaps': {'cmspages': CMSSitemap}, 'template_name': 'custom_sitemap.html'}),

                       url(r'^pos/', include('generic_positions.urls')),
                       url(r'^robots\.txt$', include('modifier.urls_robots')),
                       url(r'^call_req/', include('modifier.urls_call_req')),
#-------cms.urls must be last
                       url(r'^', include('cms.urls')),


                       )


if settings.DEBUG:
    urlpatterns = solid_i18n_patterns('',
            url(r'^rosetta/', include('rosetta.urls')),
        ) + urlpatterns


if settings.DEBUG:
    urlpatterns = patterns('',
         url(r'^static/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.STATIC_ROOT}),
         url(r'^media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT}),
                    ) + urlpatterns





