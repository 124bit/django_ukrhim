from settings import *
from settings_production import *
ADMIN_TOOLS_THEMING_CSS = 'admin_tools_override/css/admintools_theming_ecoclozet.css'
SITE_ID = 6

CMS_TEMPLATES = (
    
    ('base_ecoclozet.html', gettext('Base template')),
    ('main_ecoclozet.html', gettext('"Main" page template')),
) 


MIDDLEWARE_CLASSES = (
    'johnny.middleware.LocalStoreClearMiddleware',
   # 'django.middleware.cache.UpdateCacheMiddleware',    
    'django.middleware.gzip.GZipMiddleware',
    'django_geoip.middleware.LocationMiddleware',

    'johnny.middleware.QueryCacheMiddleware',
   # 'htmlmin.middleware.HtmlMinifyMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    #'django.contrib.auth.middleware.AuthenticationMiddleware',
    'cached_auth.Middleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    #'django.middleware.locale.LocaleMiddleware',
    #'solid_i18n.middleware.SolidLocaleMiddleware',
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

USE_ETAGS=True