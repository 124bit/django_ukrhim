from modeltranslation.translator import translator, TranslationOptions
from pdf_gen.models import Price


class PriceTranslationOptions(TranslationOptions):
    fields = ('head_name',)

translator.register(Price, PriceTranslationOptions)