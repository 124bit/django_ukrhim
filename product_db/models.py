from django.db import models
from django.utils.translation import ugettext as _
from shop.models.defaults.product import Product as Shop_product
from eav.models import Attribute
import eav
from cms.models.pluginmodel import CMSPlugin
from elfinder.fields import ElfinderField
from eav.fields import EavSlugField


class ProductType(models.Model):
    type_name=models.CharField(max_length=30,verbose_name=_("type name"), unique=True)
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
    tag_text=models.CharField(max_length=30,verbose_name=_("tag"), unique=True)

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

    #TODO make name unique, make slug field - python slug, mayby slug readonly
    #name = models.CharField(max_length=255, verbose_name=_('Name'), unique=True)


    class Meta:
        verbose_name = _('product')
        verbose_name_plural = _('products')
    def __unicode__(self):
        return self.name







class ElfinderFileHolder(CMSPlugin):

    file_field = ElfinderField()











eav.register(Product)