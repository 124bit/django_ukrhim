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
    list_display = ('name_en', 'product_type', 'active')
    list_filter= ('product_type', 'product_tags')
    list_editable = ('active',)
    prepopulated_fields = {'slug':("name_en",)}
    filter_horizontal=('additional_fields',)
    save_on_top=True

    form = ProductAdminForm
    resource_class = ProductResource

    def get_list_display(self, request):
        if get_language()=='ru':
            self.list_display = ('name_ru', 'product_type', 'active')
        else:
            self.list_display = ('name_en', 'product_type', 'active')
        price_func_slugs=[]
        for site in Site.objects.all():
            column_name=site.name
            attr_slug=site.price_field_slug
            currency=str(Attribute.objects.get(slug=attr_slug).options['price_field']['currency'])
            print _(currency)
            func_name='getter_'+attr_slug
            price_func_slugs.append(func_name)
            if func_name not in Product.__dict__:
                def get_price(self):
                    return getattr(self,attr_slug)
                get_price.short_description = _(column_name)+', '+_(currency)
                setattr(Product,func_name,get_price)
        return  list(self.list_display)+price_func_slugs



class ProductTypeAdmin(ModelAdmin):

    prepopulated_fields = {'slug': ('name_en',)}

    def get_ordering(self, *args, **kwargs):
        if get_language()=='ru':
            self.ordering = ['name_ru']
        else:
            self.ordering = ['name_en']
        return super(ProductTypeAdmin, self).get_ordering(*args, **kwargs)

    def get_list_display(self, *args, **kwargs):
        if get_language()=='ru':
            self.list_display = ('name_ru', 'count_products_of_type')
        else:
            self.list_display = ('name_en', 'count_products_of_type')
        return super(ProductTypeAdmin, self).get_list_display(*args, **kwargs)


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

