# -*- coding: utf-8 -*-
import os, platform#, sys
gettext = lambda s: s

PROJECT_PATH = os.path.abspath(os.path.dirname(__file__))

#MODULES_PATH = os.path.normpath(os.path.join(PROJECT_PATH, '..', '..')) #for importing third-party modules vonnected to git
#import_export_path = os.path.join(MODULES_PATH, 'django-import-export')
#imagekit_path = os.path.join(MODULES_PATH, 'django-imagekit')
#elfinder_path = os.path.join(MODULES_PATH, 'yawd-elfinder')
#sys.path.append(import_export_path)
#sys.path.append(imagekit_path)
#sys.path.append(elfinder_path)

#--------- DJANGO SETTINGS for django_ukrhim project.
if platform.system() == 'Linux':
    DEBUG = True
else:
    DEBUG = True
PROFILE = True
TEMPLATE_DEBUG = DEBUG

ADMINS = (
    # ('Your Name', 'your_email@example.com'),
)

MANAGERS = ADMINS

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2', # Add 'postgresql_psycopg2', 'mysql', 'sqlite3' or 'oracle'.
        'NAME': 'postgr2',                      # Or path to database file if using sqlite3.
        'USER': 'postgres',                      # Not used with sqlite3.
        'PASSWORD': '777777',                  # Not used with sqlite3.
        'HOST': '',                      # Set to empty string for localhost. Not used with sqlite3.
        'PORT': '',                      # Set to empty string for default. Not used with sqlite3.
    }
}



# Hosts/domain names that are valid for this site; required if DEBUG is False
# See https://docs.djangoproject.com/en/1.4/ref/settings/#allowed-hosts
ALLOWED_HOSTS = ['*']

# Local time zone for this installation. Choices can be found here:
# http://en.wikipedia.org/wiki/List_of_tz_zones_by_name
# although not all choices may be available on all operating systems.
# In a Windows environment this must be set to your system time zone.
TIME_ZONE = 'Europe/Kiev'

# Language code for this installation. All choices can be found here:
# http://www.i18nguy.com/unicode/language-identifiers.html
LANGUAGE_CODE = 'ru-RU'

SITE_ID = 1

# If you set this to False, Django will make some optimizations so as not
# to load the internationalization machinery.
USE_I18N = True

# If you set this to False, Django will not format dates, numbers and
# calendars according to the current locale.
USE_L10N = True

# If you set this to False, Django will not use timezone-aware datetimes.
USE_TZ = True

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
STATIC_ROOT = os.path.join(PROJECT_PATH, "static")

# URL prefix for static files.
# Example: "http://media.lawrence.com/static/"
STATIC_URL = '/static/'




# Additional locations of static files
STATICFILES_DIRS = (
    # Put strings here, like "/home/html/static" or "C:/www/django/static".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
)

# List of finder classes that know how to find static files in
# various locations.
STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
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
     'django.template.loaders.eggs.Loader',
)

MIDDLEWARE_CLASSES = (
    'django.middleware.gzip.GZipMiddleware',
   # 'htmlmin.middleware.HtmlMinifyMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.locale.LocaleMiddleware',
    'django.middleware.doc.XViewMiddleware',
    'django.middleware.common.CommonMiddleware',
    'cms.middleware.page.CurrentPageMiddleware',
    'cms.middleware.user.CurrentUserMiddleware',
    'cms.middleware.toolbar.ToolbarMiddleware',
    'cms.middleware.language.LanguageCookieMiddleware',
    'reversion.middleware.RevisionMiddleware',


)
if PROFILE and  platform.system() == 'Linux':
    MIDDLEWARE_CLASSES=('profiler.middleware.ProfilerMiddleware',
    'profiler.middleware.StatProfMiddleware') + MIDDLEWARE_CLASSES


TEMPLATE_CONTEXT_PROCESSORS = (
    'django.contrib.auth.context_processors.auth',
    'django.core.context_processors.i18n',
    'django.core.context_processors.request',
    'django.core.context_processors.media',
    'django.core.context_processors.static',
    'cms.context_processors.media',
    'sekizai.context_processors.sekizai',
    'modifier.context_processors.add_sites'
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
     #TODO repatch, update for xls

     'admin_tools',
     'admin_tools.theming',
     'admin_tools.menu',
     'admin_tools.dashboard',
     'templateaddons',
     'modeltranslation',

     #------not important
     'jsonfield',
     'django_extensions', #mangment/commands/reset_db.py patched: dest='router', default='default'
     'smuggler',
    'rosetta',
    #'htmlmin',
    'compressor',
    'cmsplugin_plaintext',

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
    'tinymce',

    'cms.plugins.text',
    'cms.plugins.inherit',

    #'polymorphic',
    'reversion',
    'profiler',
    #-----our
    #'ukrhim_shop',
    'eav',
    'product_db',
    'pdf_gen',
    'modifier', #all monkey patching of apps done her, some twix, glue for all apps

)




# A sample logging configuration. The only tangible logging
# performed by this configuration is to send an email to
# the site admins on every HTTP 500 error when DEBUG=False.
# See http://docs.djangoproject.com/en/dev/topics/logging for
# more details on how to customize your logging configuration.
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'filters': {
        'require_debug_false': {
            '()': 'django.utils.log.RequireDebugFalse'
        }
    },
    'handlers': {
        'mail_admins': {
            'level': 'ERROR',
            'filters': ['require_debug_false'],
            'class': 'django.utils.log.AdminEmailHandler'
        }
    },
    'loggers': {
        'django.request': {
            'handlers': ['mail_admins'],
            'level': 'ERROR',
            'propagate': True,
        },
    }
}



STATICFILES_DIRS = ('modifier/static', 'django_ukrhim/media/files/site_static')

#------CMS SETTINGS
TEMPLATE_DIRS = (
    "django_ukrhim/media/files/cms_templates",
    "django_ukrhim/media/files/products_media"
)

CMS_TEMPLATES = (
    ('base.html', gettext('Base template')),
    ('main.html', gettext('Main page template')),
    ('news_list.html', gettext('"News list" page template')),
    ('news.html', gettext('"News" page template')),
    ('products.html', gettext('Products (menu options) template')),
    ('product_category.html', gettext('Product categoty (menu options) template')),
    ('product_type.html', gettext('"Product type" page template')),
    ('product.html', gettext('Common "Product page" template')),
    ('where_to_buy.html', gettext('"Where to buy" page template')),
    ('about_us.html', gettext('"About us" (menu options) template')),
    ('development.html', gettext('Development (menu options) template')),
    ('development_with_us.html', gettext('"Development with us" page template')),
    ('standard.html', gettext('Common page template'))
)


LANGUAGES = [
    ('en', 'English'),
    ('ru', 'Russian')
    ]

CMS_PLUGIN_PROCESSORS = (
    'modifier.cms_plugin_processors.render_with_tags',
)

APPEND_SLASH=True
CMS_MENU_TITLE_OVERWRITE=True
CMS_REDIRECTS=True
#CMS_SOFTROOT=True
CMS_PLUGIN_TEXT_TINYMCE_CONFIG  = {
    "width": "100%",
    "height": "625px",
    "theme": "simple",
    "relative_urls": False
    }



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

ADMIN_TOOLS_THEMING_CSS = 'admin_tools_override/css/admintools_theming.css'
#A good start is to copy the admin_tools/media/admin_tools/css/theming.css to your custom file and to modify it to suits your needs.


#--------------------compressors and minifiers settings
#COMPRESS_OFFLINE= True
COMPRESS_ENABLED=False

#--SSI
ALLOWED_INCLUDE_ROOTS=('django_ukrhim/media/files/cms_templates',)