from django.db import models
from django.contrib.admin import ModelAdmin
from django.utils.translation import ugettext as _
from shop.models.defaults.product import Product as Shop_product
from itertools import chain

from eav.models import Attribute
import eav
from eav.forms import BaseDynamicEntityForm
from eav.admin import BaseEntityAdmin
from eav.registry import EavConfig
from eav.forms import BaseDynamicEntityForm

class ProductType(models.Model):
    type_name=models.CharField(max_length=30,verbose_name=_("type name"))
    fields=models.ManyToManyField(Attribute, verbose_name=_("fields of type"), blank=True)

    class Meta:
        verbose_name = _('product type')
        verbose_name_plural = _('product types')

    def count_products_of_type(self):
      return self.product_set.count()
    count_products_of_type.short_description = _("Tagged producs")

    def __unicode__(self):
        return self.type_name

class ProductTag(models.Model):
    tag_text=models.CharField(max_length=30,verbose_name=_("tag"))

    class Meta:
        verbose_name = _('Product tag')
        verbose_name_plural = _('Product tags')

    def count_tagged_products(self):
        return self.product_set.count()
    count_tagged_products.short_description = _("Tagged producs")

    def __unicode__(self):
        return self.tag_text

class Product(Shop_product):
    product_type=models.ForeignKey(ProductType, verbose_name=_("product type"), blank=True, null=True)
    additional_fields=models.ManyToManyField(Attribute, verbose_name=_("additional fields"), blank=True)
    product_tags=models.ManyToManyField(ProductTag, verbose_name=_("product tags"), blank=True)

    class Meta:
        verbose_name = _('product')
        verbose_name_plural = _('products')

    def __unicode__(self):
        return self.name


class ProductAdminForm(BaseDynamicEntityForm):
    model = Product

fields_attr=[]
class ProductAdmin(BaseEntityAdmin):
    list_display = ('slug', 'product_type', 'unit_price', 'active')
    list_filter= ('product_type', 'product_tags')
    form = ProductAdminForm

    pass

    def save_model(self, request, obj, form, change):
        obj.save()

        if obj.product_type:
            EavConfigClass.get_attributes=obj.product_type.fields.all() | obj.additional_fields.all()
        else:
            EavConfigClass.get_attributes=obj.additional_fields.all()

        eav.unregister(Product)
        ProductAdminForm.model=obj
        eav.register(obj, EavConfigClass)



class ProductTypeAdmin(ModelAdmin):
    list_display = ('type_name', 'count_products_of_type')
    ordering = ['type_name']

class ProductTagAdmin(ModelAdmin):
    list_display = ('tag_text', 'count_tagged_products')
    ordering = ['tag_text']

class EavConfigClass(EavConfig):
    get_attributes=[]

eav.register(Product, EavConfigClass)