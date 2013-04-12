from django.conf.urls import patterns, include, url

from django.contrib import admin
from django.conf import settings
from filebrowser.sites import site
admin.autodiscover()
import object_tools

object_tools.autodiscover()
urlpatterns = patterns('',

                       (r'^admin/', include(admin.site.urls)),

                       url(r'^elfinder/', include('elfinder.urls')),



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







