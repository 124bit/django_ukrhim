from django.db import models
from django.utils.translation import ugettext as _
from eav.models import Attribute
from eav.fields import EavSlugField
import eav

from django.contrib.sites.models import Site

class ProductType(models.Model):
    name=models.CharField(max_length=30,verbose_name=_("type name"), unique=True)
    fields=models.ManyToManyField(Attribute, verbose_name=_("fields of type"), blank=True)
    slug=EavSlugField(max_length=30,verbose_name=_("type slug"), unique=True)
    class Meta:
        verbose_name = _('product type')
        verbose_name_plural = _('product types')

    def count_products_of_type(self):
      return self.product_set.count()
    count_products_of_type.short_description = _("Tagged producs")

    def __unicode__(self):
        return self.name






class ProductTag(models.Model):
    name=models.CharField(max_length=30,verbose_name=_("tag name"), unique=True)
    slug=EavSlugField(max_length=30,verbose_name=_("tag slug"), unique=True)
    class Meta:
        verbose_name = _('Product tag')
        verbose_name_plural = _('Product tags')

    def count_tagged_products(self):
        return self.product_set.count()
    count_tagged_products.short_description = _("Tagged producs")

    def __unicode__(self):
        return self.name






class Product(models.Model):
    name = models.CharField(max_length=50, verbose_name=_('Name'),unique=True)
    slug = EavSlugField(max_length=60, verbose_name=_('Slug'), unique=True)
    product_type=models.ForeignKey(ProductType, verbose_name=_("product type"), blank=True, null=True)
    additional_fields=models.ManyToManyField(Attribute, verbose_name=_("additional fields"), blank=True)
    product_tags=models.ManyToManyField(ProductTag, verbose_name=_("product tags"), blank=True)
    active = models.BooleanField(default=True, verbose_name=_('Active'))
    date_added = models.DateTimeField(auto_now_add=True,
                                      verbose_name=_('Date added'))
    last_modified = models.DateTimeField(auto_now=True,
                                         verbose_name=_('Last modified'))


    #TODO make name unique, make slug field - python slug, mayby slug readonly



    class Meta:
        verbose_name = _('product')
        verbose_name_plural = _('products')

    def __unicode__(self):
        return self.name

    def get_secondary_attributes(self):
        '''get activated product EAV attributes'''
        try:
            if self.product_type:
                attrs=self.product_type.fields.all() | self.additional_fields.all()
            else:
                attrs=self.additional_fields.all()
            attrs=attrs.order_by('importance').reverse()
        except ValueError:
            attrs=Attribute.objects.none()

        return attrs



    def price(self):
        ''' get price field depending on site options'''
        price_slug=Site.objects.get_current().price_field_slug
        try:
            return getattr(self, price_slug)
        except AttributeError:
            return ''

    #----for direct EAV attr access
    def __getattr__(self, attr):
        return getattr(self.eav, attr)

    #----for export_import attribute import
    def set_attr(self, attr, value):
        #Todo think, rewrite
        try:
                print value, type(value)
                getattr(self.__dict__['eav'],attr)
                if self.get_secondary_attributes().filter(slug=attr).count()!=0:
                    if (str(value)!='-' and str(value)!=''):
                        setattr(self.__dict__['eav'],attr, value)
                    elif str(value)=='-' or str(value)=='':
                        try:
                            self.additional_fields.remove(Attribute.objects.get(slug=attr))
                        except:
                            pass
                else:
                    if str(value)!='-' and str(value)!='':
                        self.additional_fields.add(Attribute.objects.get(slug=attr))
                        setattr(self.__dict__['eav'],attr, value)



        except:
            self.__dict__[attr]=value





















eav.register(Product)