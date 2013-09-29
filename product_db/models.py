from django.db import models
from django.utils.translation import ugettext as _
from eav.models import Attribute
from eav.fields import EavSlugField
import eav
from django.utils.translation import get_language
from elfinder.fields import ElfinderField
from inline_ordering.models import Orderable
from django.contrib.sites.models import Site
from cms.utils.i18n import get_fallback_languages
from django.utils.safestring import mark_safe
from datetime import datetime
class ProductType(models.Model):
    name=models.CharField(max_length=30,verbose_name=_("Type name"))
    slug=EavSlugField(max_length=30,verbose_name=_("Type slug"),help_text=_("Short unique type label."), unique=True)
    fields=models.ManyToManyField(Attribute, verbose_name=_("Fields of type"), help_text=_("Data fields always assigned to products of this type."), blank=True)
    type_description=models.TextField(null=True, blank=True ,verbose_name=_("Product description"), help_text=_("Common description for products of this type."))
    template=models.TextField(null=True, blank=True ,verbose_name=_("Template"), help_text=_("Common template to render product on its page."))
    changed=models.DateTimeField(auto_now=True)
    
    class Meta:
        verbose_name = _('product type')
        verbose_name_plural = _('Product types')

    def count_products_of_type(self):
      return self.product_set.count()
    count_products_of_type.short_description = _("Tagged producs")


    
    def get_products_of_type_and_accessoires(self):
        accs_list=[]
        accesoires=Product.objects.filter(product_type__slug='accessoires')
        for acc in accesoires:
            try:
                if str(self.pk) in acc.type_accessoires:
                    accs_list.append(acc)
            except AttributeError:
                pass
        products=self.product_set.all()
        return products,accs_list

    def __unicode__(self):
        current_lang=get_language()
        if current_lang=='ru':
            return self.name_ru
        else:
            return  self.name_en






class ProductTag(models.Model):
    name_ru=models.CharField(max_length=30,verbose_name=_("Tag name (ru)"), unique=True)
    name_en=models.CharField(max_length=30,verbose_name=_("Tag name (en)"), unique=True)
    slug=EavSlugField(max_length=30,verbose_name=_("Tag slug"),help_text=_("Short unique tag label."), unique=True)
    class Meta:
        verbose_name = _('product tag')
        verbose_name_plural = _('Product tags')

    def count_tagged_products(self):
        return self.product_set.count()
    count_tagged_products.short_description = _("Tagged producs")

    def __unicode__(self):
        current_lang=get_language()
        if current_lang=='ru':
            return self.name_ru
        else:
            return  self.name_en






class Product(models.Model):
    name_ru = models.CharField(max_length=50, verbose_name=_('Name (ru)'),unique=True)
    name_en = models.CharField(max_length=50, verbose_name=_('Name (en)'),unique=True)
    slug = EavSlugField(max_length=60, verbose_name=_('Slug'),help_text=_("Short unique product label."), unique=True)
    product_type=models.ForeignKey(ProductType, verbose_name=_("Product type"),help_text=_("Product type assigns some data fields to products."), null=True)
    additional_fields=models.ManyToManyField(Attribute, verbose_name=_("Additional fields"), blank=True)
    product_tags=models.ManyToManyField(ProductTag, verbose_name=_("Product tags"),help_text=_("Tags are used for quick searching for products."), blank=True)
    active = models.BooleanField(default=True, verbose_name=_('Active'),help_text=_("If product is deactivated - it doesn't shown anywhere."))
    position_in_list = models.IntegerField(verbose_name=_('Position in type'))
    date_added = models.DateTimeField(auto_now_add=True,
                                      verbose_name=_('Date added'))
    last_modified = models.DateTimeField(auto_now=True,
                                         verbose_name=_('Last modified'))

    def get_prices_for_list(self):

        return self.product_set.count()
    get_prices_for_list.short_description = _("Tagged producs")

    #TODO make name unique, make slug field - python slug, mayby slug readonly






    class Meta:
        verbose_name = _('product')
        verbose_name_plural = _('Products')
        ordering = ['position_in_list']
        

    def save(self,*args, **kwargs):
        super(Product, self).save(*args, **kwargs)
        self.product_type.changed=datetime.now()
        self.product_type.save()
        if self.product_type.slug == "accessoires":
            try:
                for pk in self.type_accessoires:
                    try:
                        type=ProductType.objects.get(pk=pk)
                        type.changed=datetime.now()
                        type.save()
                    except:
                        pass
            except TypeError:
                pass
        
    def __unicode__(self):
        current_lang=get_language()
        if current_lang=='ru':
            return self.name_ru
        else:
            return  self.name_en

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


    # if site - sites prices, no site - auto, if indexes - index price, if no - index 0, if price slug - then price slug
    def price(self, site=None, price_index=None, price_slug=None, lang=None):
        ''' get price field depending on site options and lang'''
        res=''
        if not price_slug:
            if site:
                if price_index:
                    price_slug=Site.objects.get(site_cutting=site).price_field_slugs.split(', ')[price_index]
                else:
                    price_slug=Site.objects.get(site_cutting=site).price_field_slugs.split(', ')[0]
            else:
                if price_index:
                    price_slug=Site.objects.get_current().price_field_slugs.split(', ')[price_index]
                else:
                    price_slug=Site.objects.get_current().price_field_slugs.split(', ')[0]
        
                 
        try:
            field=Attribute.objects.get(slug=price_slug) 
            try:
                if 'price_field' in field.options and 'dependent' in field.options['price_field']:
                    res= getattr(self, str(field.options['price_field']['dependent']))
                    try:
                        res=round(float(res)/float(field.options['price_field']['rate']),2)
                        if abs(res-round(res)) < 0.001:
                            res=int(res)
                    except ValueError:
                        pass
                    res= unicode(res)
                    if res.lower() == u'ожидается' or res.lower() == u'на стадии разработки':
                        res= 'in developed'
                    elif res.lower() == u'цену уточняйте':
                        res= 'ask for price'
                    
            except TypeError:
                pass
            if not res:   
                res=unicode(getattr(self, price_slug))
            
            if lang=='en':
                if res.strip().lower() == u'ожидается' or res.lower() == u'на стадии разработки':
                    res = 'in developed'
                        
                if res.strip().lower() == u'цену уточняйте':
                    res = 'ask for price'
            
            return res   
            
        except AttributeError:
            return ''

    def get_description(self, product_type=None):
        if product_type:
           return mark_safe(self.descr_m.replace('{}',unicode(product_type.type_description)))
        return mark_safe(self.descr_m.replace('{}',unicode(self.product_type.type_description)))
        
    def get_description_left(self, product_type=None):
        if product_type:
            return mark_safe(self.descr_left_m.replace('{}',unicode(product_type.type_description_left)))
        return mark_safe(self.descr_left_m.replace('{}',unicode(self.product_type.type_description_left)))
    #----for direct EAV attr access
    def __getattr__(self, attr):
        current_lang=get_language()
        lang_attr=attr+'_'+current_lang

        if lang_attr in self.__dict__:
                return self.__dict__[lang_attr]

        for lang in get_fallback_languages(current_lang):
            lang_attr=attr+'_'+lang
            if lang_attr in self.__dict__:
                return self.__dict__[lang_attr]

        # secondary_attrs=self.get_secondary_attributes()
        # if attr in secondary_attrs:
        #     return getattr(self.eav, attr)
        #
        # lang_attr=attr+'_'+current_lang
        # if lang_attr in secondary_attrs:
        #         return getattr(self.eav, lang_attr)
        #
        # for lang in get_fallback_languages(current_lang):
        #     lang_attr=attr+'_'+lang
        #     if lang_attr in secondary_attrs:
        #         return getattr(self.eav, lang_attr)
        if attr== '_position_in_list_cache': #for position field
            raise AttributeError
        if attr[-2:]=='_m':
        	lang_attr=attr[:-2]+'_'+current_lang
        	try:
        		return getattr(self.eav, lang_attr)
        	except AttributeError:
        		for lang in get_fallback_languages(current_lang):
        			lang_attr=attr[:-2]+'_'+lang
        			try:
        				return getattr(self.eav, lang_attr)
        			except AttributeError:
        				pass
        		return ''
        else:
        	return getattr(self.eav, attr)



    #----for export_import attribute import
    def set_attr(self, attr, value):
        #Todo think, rewrite
        try:
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
