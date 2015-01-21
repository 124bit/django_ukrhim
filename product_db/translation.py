from modeltranslation.translator import translator, TranslationOptions
from product_db.models import ProductType


class ProductTypeTranslationOptions(TranslationOptions):
    fields = ('name', 'type_description')

translator.register(ProductType, ProductTypeTranslationOptions)