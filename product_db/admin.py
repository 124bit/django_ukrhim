__author__ = 'Agafon'
from django.contrib import admin
from django.contrib.admin import ModelAdmin
from models import *
from eav.forms import BaseDynamicEntityForm
from eav.admin import BaseEntityAdmin
from import_export.resources import ModelResource

class ProductAdminForm(BaseDynamicEntityForm):
    model = Product


#TODO no new products IMPORT!
class ProductResource(ModelResource):

    class Meta:
        model = Product
        fields = ('name',)
        import_id_fields=['name']
        export_order=('name',)




class ProductAdmin(BaseEntityAdmin):
    list_display = ('slug', 'product_type', 'active')
    list_filter= ('product_type', 'product_tags')
    list_editable = ('active',)
    prepopulated_fields = {'slug':("name",)}
    filter_horizontal=('additional_fields',)
    save_on_top=True

    form = ProductAdminForm
    resource_class = ProductResource


class ProductTypeAdmin(ModelAdmin):
    list_display = ('name', 'count_products_of_type')
    ordering = ['name']
    prepopulated_fields = {'slug': ('name',)}


class ProductTagAdmin(ModelAdmin):
    list_display = ('name', 'count_tagged_products')
    ordering = ['name']
    prepopulated_fields = {'slug': ('name',)}






admin.site.register(Product, ProductAdmin)
admin.site.register(ProductType, ProductTypeAdmin)
admin.site.register(ProductTag, ProductTagAdmin)

