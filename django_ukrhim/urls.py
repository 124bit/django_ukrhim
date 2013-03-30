from django.conf.urls import patterns, include, url

from django.contrib import admin
from django.conf import settings

admin.autodiscover()

urlpatterns = patterns('',
    #                   (r'^grappelli/', include('grappelli.urls')),
    #                    url(r'^admin_tools/', include('admin_tools.urls')),
                       (r'^admin/', include(admin.site.urls)),
    #                   (r'^shop/', include('shop.urls')),

                       url(r'^', include('cms.urls')),
                       )


if settings.DEBUG:
    urlpatterns = patterns('',
                           url(r'^media/(?P<path>.*)$', 'django.views.static.serve',
                               {'document_root': settings.MEDIA_ROOT, 'show_indexes': True}),
                           url(r'', include('django.contrib.staticfiles.urls')),
                           ) + urlpatterns







