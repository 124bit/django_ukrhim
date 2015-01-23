# -*- coding: utf-8 -*-
import os, platform#, sys
gettext = lambda s: s

PROJECT_PATH = os.path.abspath(os.path.dirname(__file__))



DEBUG = True
TEMPLATE_DEBUG = DEBUG

ADMINS = (
    ('124bit', '124bit@gmail.com'),
)

MANAGERS = ADMINS



DATABASES = {
'default': {
    'ENGINE': 'django.db.backends.postgresql_psycopg2', # Add 'postgresql_psycopg2', 'mysql', 'sqlite3' or 'oracle'.
    'NAME': 'django_ukrhim_db',                      # Or path to database file if using sqlite3.
    'USER': 'postgres',                      # Not used with sqlite3.
    'PASSWORD': 'postgres',
    'HOST': '',                      # Set to empty string for localhost. Not used with sqlite3.
    'PORT': '',                      # Set to empty string for default. Not used with sqlite3.
}}


# Hosts/domain names that are valid for this site; required if DEBUG is False
# See https://docs.djangoproject.com/en/1.4/ref/settings/#allowed-hosts
ALLOWED_HOSTS = ['*']

# Local time zone for this installation. Choices can be found here:
# http://en.wikipedia.org/wiki/List_of_tz_zones_by_name
# although not all choices may be available on all operating systems.
# In a Windows environment this must be set to your system time zone.
TIME_ZONE = 'Europe/Kiev'
USE_TZ = True
# Language code for this installation. All choices can be found here:
# http://www.i18nguy.com/unicode/language-identifiers.html
LANGUAGE_CODE = 'ru'

SITE_ID = 1

# If you set this to False, Django will make some optimizations so as not
# to load the internationalization machinery.
USE_I18N = True

# If you set this to False, Django will not format dates, numbers and
# calendars according to the current locale.
USE_L10N = True



# Absolute filesystem path to the directory that will hold user-uploaded files.
# Example: "/home/media/media.lawrence.com/media/"
MEDIA_ROOT = os.path.join(PROJECT_PATH, "media")


# URL that handles the media served from MEDIA_ROOT. Make sure to use a
# trailing slash.
# Examples: "http://media.lawrence.com/media/", "http://example.com/media/"
MEDIA_URL = "/media/"

# Absolute path to the directory static files should be collected to.
# Don't put anything in this directory yourself; store your static files
# in apps' "static/" subdirectories and in STATICFILES_DIRS.
# Example: "/home/media/media.lawrence.com/static/"
STATIC_ROOT = os.path.join(PROJECT_PATH, "media/files/site_static")

# URL prefix for static files.
# Example: "http://media.lawrence.com/static/"
STATIC_URL = '/media/files/site_static/'




# Additional locations of static files
STATICFILES_DIRS = (
    # Put strings here, like "/home/html/static" or "C:/www/django/static".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
)

# List of finder classes that know how to find static files in
# various locations.
STATICFILES_FINDERS = (
 #   'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
 #   'django.contrib.staticfiles.finders.DefaultStorageFinder',
    'compressor.finders.CompressorFinder',
)

# Make this unique, and don't share it with anybody.
SECRET_KEY = '(^b_707imhz9f&amp;v)wt19l5c&amp;djxv9t+7*bu$w(x!yyf1*l^1c&amp;'

# List of callables that know how to import templates from various sources.
TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.Loader',
    'django.template.loaders.app_directories.Loader',
#     'django.template.loaders.eggs.Loader',
)

MIDDLEWARE_CLASSES = (
    'johnny.middleware.LocalStoreClearMiddleware',
   # 'django.middleware.cache.UpdateCacheMiddleware',    
    'django.middleware.gzip.GZipMiddleware',
    'django_geoip.middleware.LocationMiddleware',
    'django.middleware.http.ConditionalGetMiddleware',
    'johnny.middleware.QueryCacheMiddleware',
   # 'htmlmin.middleware.HtmlMinifyMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    #'django.contrib.auth.middleware.AuthenticationMiddleware',
    'cached_auth.Middleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    #'django.middleware.locale.LocaleMiddleware',
    'solid_i18n.middleware.SolidLocaleMiddleware',
    'django.middleware.doc.XViewMiddleware',
    'django.middleware.common.CommonMiddleware',
    
    'cms.middleware.page.CurrentPageMiddleware',
    'cms.middleware.user.CurrentUserMiddleware',
    #'cms.middleware.toolbar.ToolbarMiddleware',
    'cms.middleware.language.LanguageCookieMiddleware',
    'reversion.middleware.RevisionMiddleware',
    #'django.middleware.cache.FetchFromCacheMiddleware',
    #'modifier.middleware.profile.ProfileMiddleware',

)



TEMPLATE_CONTEXT_PROCESSORS = (
    'django.contrib.auth.context_processors.auth',
    'django.core.context_processors.i18n',
    'django.core.context_processors.request',
    'django.core.context_processors.media',
    'django.core.context_processors.static',
    'cms.context_processors.media',
    'sekizai.context_processors.sekizai',
    'modifier.context_processors.add_sites',
    'modifier.context_processors.location'
    
)

ROOT_URLCONF = 'django_ukrhim.urls'

# Python dotted path to the WSGI application used by Django's runserver.
WSGI_APPLICATION = 'django_ukrhim.wsgi.application'




INSTALLED_APPS = (
# s = s.replace(/[-\s]+/g, '_'); // convert spaces to hyphens #changed  indjango urlify.js
    #-------important
     'elfinder', #patched #all places, where "magic" library is  used changed for returning nothing. Default setting for images folder - files
     'imagekit', #patched  #todo rewrite patches, conspect
     'import_export', #patched

     'admin_tools', #patched recent actions template (maybe)
     'admin_tools.theming',
     'admin_tools.menu',
     'admin_tools.dashboard',
     'templateaddons',
     'modeltranslation',
     'inline_ordering',
     'compressor',
     'jsonfield',
     'django_geoip',
     #------not important
     'django_extensions', #mangment/commands/reset_db.py patched: dest='router', default='default'
    'rosetta',
    #'htmlmin',
    'django_reset',
   # 'profiler',
    'adv_cache_tag',
    #----django
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites', #patched in modifier
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.sitemaps',
    'django.contrib.admin',
    'django.contrib.admindocs',
    #----django-cms
    'cms', #patched in modifier
    'mptt',
    'menus',
    'south',
    'sekizai',
    #'cms.plugins.text',
    'cms.plugins.inherit',
    'cmsplugin_plaintext',
    'cmsplugin_htmlsitemap',
    'django_ace',
    #'polymorphic',
    'reversion',
    #-----our
    #'ukrhim_shop',
    'eav',
    'product_db',
    'pdf_gen',
    'modifier', #all monkey patching of apps done her, some twix, glue for all apps
    'ukrhim_gallery'

)




# A sample logging configuration. The only tangible logging
# performed by this configuration is to send an email to
# the site admins on every HTTP 500 error when DEBUG=False.
# See http://docs.djangoproject.com/en/dev/topics/logging for
# more details on how to customize your logging configuration.
#LOGGING = {
#    'version': 1,
#    'disable_existing_loggers': False,
#    'filters': {
#       'require_debug_false': {
#            '()': 'django.utils.log.RequireDebugFalse'
#        }
#    },
#    'handlers': {
#        'mail_admins': {
#            'level': 'ERROR',
#            'filters': ['require_debug_false'],
#            'class': 'django.utils.log.AdminEmailHandler'
#        }
#    },
#    'loggers': {
#        'django.request': {
#            'handlers': ['mail_admins'],
#            'level': 'ERROR',
#            'propagate': True,
#        },
#    }
#}

# import logging
#
#
# logging.basicConfig(
#     level = logging.INFO,
#     format = '%(asctime)s %(levelname)s %(message)s',
#     filename = PROJECT_PATH+'/djangoLog.log',)
#
#
# import logging
# logging.info(PROJECT_PATH)
# logging.info(str(DATABASES))
  
STATICFILES_DIRS = ('modifier/static', 'django_ukrhim/media/files/site_static')

#------CMS SETTINGS
TEMPLATE_DIRS = ( MEDIA_ROOT+"/cms_templates",
)

CMS_TEMPLATES = (
    
    ('base.html', gettext('Base template')),
    ('blank.html', gettext('Fully blank tmpl with plchd')),
    ('standard.html', gettext('Base page template with clean middle plchldr')),
    ('standard_with_bg.html', gettext('Base page template with middle plchldr on background')),
    ('main.html', gettext('"Main" page template')),
    ('gallery.html', gettext('"Gallery" page template')),
    ('news_list.html', gettext('"News list" page template')),
    ('news.html', gettext('"News" page template')),
    ('share.html', gettext('"Share and sale" page template')),
    ('products.html', gettext('Products (empty) template')),
    ('product_category.html', gettext('Product category (empty) template')),
    ('product_type.html', gettext('"Product type" page template')),
    ('product_type_w_sections.html', gettext('"Product type" page template with many sections in content')),
    ('product_type_without_header.html', gettext('"Product type" page template without header')),
    
    ('product.html', gettext('Auto "Product page" template')),
    ('where_to_buy.html', gettext('"Where to buy" page template')),
    ('about_us.html', gettext('"About us" (menu options) template')),
    ('development.html', gettext('Development (menu options) template')),
    ('development_with_us.html', gettext('"Development with us" page template')),
    ('contacts.html', gettext('"Contacts" page template')),
    ('search.html', gettext('"Search" page template')),
    ('cert_or_instr.html', gettext('"Certificate" or "Instructions" page template'))
)


LANGUAGES = [
    ('en', 'English'),
    ('ru', 'Russian')
    ]

CMS_PLUGIN_PROCESSORS = (
    'modifier.cms_plugin_processors.render_with_tags',
)

APPEND_SLASH=True
SOLID_I18N_USE_REDIRECTS=False
CMS_MENU_TITLE_OVERWRITE=True
CMS_REDIRECTS=True
#CMS_SOFTROOT=True
PLACEHOLDER_FRONTEND_EDITING=False
CMS_CACHE_DURATIONS = {}
CMS_CACHE_DURATIONS['content']=0
CMS_CACHE_DURATIONS['menus']=0
CMS_CACHE_DURATIONS['permissions']=0

CMS_SEO_FIELDS=True
CMS_LANGUAGES = {
    1: [
        {
            'code': 'en',
            'name': gettext('English'),
            'fallbacks': ['ru'],
            'public': True,
            'hide_untranslated': True,
            'redirect_on_fallback':False,
        },
        {
            'code': 'ru',
            'name': gettext('Russian'),
            'fallbacks': ['en'],
            'public': True,
            'hide_untranslated': True,
            'redirect_on_fallback':True,
        }
    ],
    2: [
        {
            'code': 'en',
            'name': gettext('English'),
            'fallbacks': ['ru'],
            'public': True,
            'hide_untranslated': True,
            'redirect_on_fallback':False,
        },
        {
            'code': 'ru',
            'name': gettext('Russian'),
            'fallbacks': ['en'],
            'public': True,
            'hide_untranslated': True,
            'redirect_on_fallback':True,
        }
    ],
    3: [
        {
            'code': 'en',
            'name': gettext('English'),
            'fallbacks': ['ru'],
            'public': True,
            'hide_untranslated': True,
            'redirect_on_fallback':False,
        },
        {
            'code': 'ru',
            'name': gettext('Russian'),
            'fallbacks': ['en'],
            'public': True,
            'hide_untranslated': True,
            'redirect_on_fallback':True,
        }
    ],
    4: [
        {
            'code': 'en',
            'name': gettext('English'),
            'fallbacks': ['ru'],
            'public': True,
            'hide_untranslated': True,
            'redirect_on_fallback':False,
        },
        {
            'code': 'ru',
            'name': gettext('Russian'),
            'fallbacks': ['en'],
            'public': True,
            'hide_untranslated': True,
            'redirect_on_fallback':True,
        }
    ],
    5: [
        {
            'code': 'en',
            'name': gettext('English'),
            'fallbacks': ['ru'],
            'public': True,
            'hide_untranslated': True,
            'redirect_on_fallback':False,
        },
        {
            'code': 'ru',
            'name': gettext('Russian'),
            'fallbacks': ['en'],
            'public': True,
            'hide_untranslated': True,
            'redirect_on_fallback':True,
        }#,
        #{
        #    'code': 'kz',
        #    'name': gettext('Kazakh'),
        #    'fallbacks': ['ru', 'en'],
        #    'public': True,
        #    'hide_untranslated': True,
        #    'redirect_on_fallback':True,
        #}
    ],
    6: [
        {
            'code': 'ru',
            'name': gettext('Russian'),
            'fallbacks': [],
            'public': True,
            'hide_untranslated': False,
            'redirect_on_fallback':False,
        }
    ],
    7: [
        {
            'code': 'en',
            'name': gettext('English'),
            'fallbacks': ['ru'],
            'public': True,
            'hide_untranslated': True,
            'redirect_on_fallback':False,
        },
        {
            'code': 'ru',
            'name': gettext('Russian'),
            'fallbacks': ['en'],
            'public': True,
            'hide_untranslated': True,
            'redirect_on_fallback':True,
        }
    ],
    'default':
        {
            'code': 'ru',
            'name': gettext('Russian'),
            'fallbacks': ['en'],
            'public': True,
            'hide_untranslated': True,
            'redirect_on_fallback':True,
        }

}
#-----import_export SETTINGS
SERIALIZATION_MODULES = {
 #   'csv': 'snippetscream.csv_serializer',
    }


#-----------django_admin_tools settings
ADMIN_TOOLS_MENU = 'modifier.custom_menu.CustomMenu'
ADMIN_TOOLS_INDEX_DASHBOARD = 'modifier.custom_dashbord.CustomIndexDashboard'
ADMIN_TOOLS_APP_INDEX_DASHBOARD = 'modifier.custom_dashbord.CustomAppIndexDashboard'


#A good start is to copy the admin_tools/media/admin_tools/css/theming.css to your custom file and to modify it to suits your needs.


#--------------------compressors and minifiers settings
COMPRESS_OFFLINE = False
COMPRESS_ENABLED = True
COMPRESS_STORAGE = 'compressor.storage.GzipCompressorFileStorage'

#--SSI
# if platform.system() == 'Linux':
	# if PROJECT_PATH == '/srv/www/django_ukrhim_dev/django_ukrhim':
		# ALLOWED_INCLUDE_ROOTS=('/srv/www/django_ukrhim_dev/django_ukrhim/media/files/cms_templates/',)
	# else:
		# ALLOWED_INCLUDE_ROOTS=('/srv/www/django_ukrhim/django_ukrhim/media/files/cms_templates/',)
# else:
	# ALLOWED_INCLUDE_ROOTS=('django_ukrhim/media/files/cms_templates/',)
# print ALLOWED_INCLUDE_ROOTS

#----memcached
# CACHES = {
    # 'default': {
        # 'BACKEND': 'django.core.cache.backends.memcached.MemcachedCache',
        # 'LOCATION': '127.0.0.1:11211',
    # }
# }
#CACHE_MIDDLEWARE_SECONDS=1
# cache

USE_ETAGS=True

ADV_CACHE_VERSIONING=True
#----johnycache

CACHES = {
    'default' : dict(
        BACKEND = 'johnny.backends.memcached.MemcachedCache',
        LOCATION = ['127.0.0.1:11211'],
        JOHNNY_CACHE = True,
    )
}


JOHNNY_MIDDLEWARE_KEY_PREFIX='jc_ukrhim_'
PAGES_DATES_PREFIX='dates_ukrhim_'
KEY_PREFIX='ukrhim_'
ADV_CACHE_VERSION='ukrhimadv_'
CMS_CACHE_PREFIX='ukrhim_'

#--------locale
LOCALE_PATHS = ( PROJECT_PATH+"/locale",)

#---------GEO_IP
GEOIP_LOCATION_MODEL = 'django_geoip.models.City'

#---email
EMAIL_HOST_USER = 'call_asker@ukrhimplast.com'
EMAIL_HOST_PASSWORD = '777777' 
EMAIL_HOST='smtp.yandex.ru'
EMAIL_PORT = 587
EMAIL_USE_TLS = True
