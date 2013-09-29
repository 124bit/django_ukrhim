__author__ = 'Agafon'
from django.contrib import admin
from django.contrib.admin import ModelAdmin
from models import Product,ProductTag,ProductType
from eav.forms import BaseDynamicEntityForm
from eav.admin import BaseEntityAdmin
from eav.models import Attribute
from import_export.resources import ModelResource
from django.utils.translation import ugettext as _
from django.contrib.sites.models import Site
from django.utils.translation import get_language
from import_export.admin import ImportExportModelAdmin
from django.conf import settings
from inline_ordering.admin import OrderableStackedInline
from django_ace import AceWidget
from django.db import models
class ProductAdminForm(BaseDynamicEntityForm):
    model = Product


#TODO no new products IMPORT!
class ProductResource(ModelResource):

    class Meta:
        model = Product
        fields = ('name_en',)
        import_id_fields=['name_en']
        export_order=('name_en',)




class ProductAdmin(BaseEntityAdmin, ImportExportModelAdmin):
    list_display = ('name_en', 'product_type', 'active')
    list_filter= ('product_type', 'product_tags')
    list_editable = ('active',)
    prepopulated_fields = {'slug':("name_en",)}
    filter_horizontal=('additional_fields',)
    save_on_top=True
    form = ProductAdminForm
    resource_class = ProductResource

    
    def get_ordering(self, request):
        if get_language()=='ru':
            self.ordering = ('name_ru', )
        else:
            self.ordeging = ('name_en', )
        return self.ordering
        
    def get_list_display(self, request):
        if get_language()=='ru':
            self.list_display = ('name_ru', 'slug' , 'product_type')
        else:
            self.list_display = ('name_en', 'slug', 'product_type')
        price_func_slugs=[]
        for site in Site.objects.all():
            column_name=site.site_cutting
            attr_slugs=site.price_field_slugs.split(', ')
            for attr_slug in attr_slugs:
                if 'dependent' not in Attribute.objects.get(slug=attr_slug).options['price_field']:
                    currency=Attribute.objects.get(slug=attr_slug).units
                    func_name='getter_'+attr_slug
                    price_func_slugs.append(func_name)
                    if func_name not in Product.__dict__:
                        def get_price_generator(slug):
                            def get_price(self):
                                try:
                                    return self.price(price_slug=slug)
                                except AttributeError:
                                    return ''
                            get_price.short_description = _(column_name)+', '+currency
                            return  get_price
                        setattr(Product,func_name,get_price_generator(attr_slug))
        return  list(self.list_display)+price_func_slugs+['active']




class ProductTypeAdmin(ModelAdmin):
    formfield_overrides = {
            models.TextField: {'widget': AceWidget(mode='html', wordwrap=True, theme='eclipse') }
        }
    prepopulated_fields = {'slug': ('name_en',)}
    list_display = ('name','slug', 'count_products_of_type')
    save_on_top=True
    filter_horizontal = ('fields',)
    ordering = ['name']

    fieldsets = (
        (None, {
            'fields': ['name_'+lang[0] for lang in settings.LANGUAGES] + ['slug', 'fields']
        }),
        (_('Additional options'), {
            'fields': ['template'] + ['type_description_'+lang[0] for lang in settings.LANGUAGES]
        }),
        )



class ProductTagAdmin(ModelAdmin):
    prepopulated_fields = {'slug': ('name_en',)}

    def get_ordering(self, *args, **kwargs):
        if get_language()=='ru':
            self.ordering = ['name_ru']
        else:
            self.ordering = ['name_en']
        return super(ProductTagAdmin, self).get_ordering(*args, **kwargs)

    def get_list_display(self, *args, **kwargs):
        if get_language()=='ru':
            self.list_display = ('name_ru', 'count_tagged_products')
        else:
            self.list_display = ('name_en', 'count_tagged_products')
        return super(ProductTagAdmin, self).get_list_display(*args, **kwargs)






admin.site.register(Product, ProductAdmin)
admin.site.register(ProductType, ProductTypeAdmin)
admin.site.register(ProductTag, ProductTagAdmin)

