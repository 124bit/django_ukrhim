from modeltranslation.translator import translator, TranslationOptions
from eav.models import Attribute


class AttributeTranslationOptions(TranslationOptions):
    fields = ('name', 'units')

translator.register(Attribute, AttributeTranslationOptions)