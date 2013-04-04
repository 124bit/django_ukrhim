__author__ = 'Agafon'
from django.contrib import admin
from django.contrib.admin import ModelAdmin
from models import *
from eav.forms import BaseDynamicEntityForm
from eav.admin import BaseEntityAdmin
from import_export.resources import ModelResource

class ProductAdminForm(BaseDynamicEntityForm):
    model = Product

class ProductResource(ModelResource):
    class Meta:
        model = Product
        fields = ('name', 'unit_price', 'active')
        import_id_fields=['name']


class ProductAdmin(BaseEntityAdmin):
    list_display = ('slug', 'product_type', 'unit_price', 'active')
    list_filter= ('product_type', 'product_tags')
    list_editable = ('unit_price', 'active')
    prepopulated_fields = {'slug':("name",)}
    filter_horizontal=('additional_fields',)
    save_on_top=True

    form = ProductAdminForm
    resource_class = ProductResource


class ProductTypeAdmin(ModelAdmin):
    list_display = ('type_name', 'count_products_of_type')
    ordering = ['type_name']


class ProductTagAdmin(ModelAdmin):
    list_display = ('tag_text', 'count_tagged_products')
    ordering = ['tag_text']





admin.site.register(Product, ProductAdmin)
admin.site.register(ProductType, ProductTypeAdmin)
admin.site.register(ProductTag, ProductTagAdmin)