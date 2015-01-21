from modeltranslation.translator import translator, TranslationOptions
from django.contrib.sites.models import Site

class SiteTranslationOptions(TranslationOptions):
    fields = ('company', 'country')

translator.register(Site, SiteTranslationOptions)