from django.db import models
from elfinder.fields import ElfinderField
from django.contrib.sites.models import Site
from django.utils.translation import ugettext as _
from django.db.models import SlugField, ForeignKey, DateTimeField, CharField
from django.conf import settings
from appy.pod.renderer import Renderer
from os import path
from product_db.models import Product, ProductTag, ProductType
from datetime import datetime
from django.utils.timezone import now

class Price(models.Model):
    prices_path=path.join(settings.PROJECT_PATH,settings.MEDIA_ROOT,'prices')

    name=SlugField(_("Document name"), max_length=50, help_text=_("Use this name like '{% load price_file %} {% price_file site='auto' lang='auto' %}'." ),
                   unique=True)
    last_update= DateTimeField(_("Last document update"), default=datetime(1980,2,2), editable=False)


    #todo show normal datetime everywhere
    def get_update_time(self):
        if self.last_update.year==1980:
            return _("Price never generated")
        else:
            return self.last_update
    get_update_time.short_description = _("Update time")

    def generate_new_prices(self):
        for template in self.pricetemplate_set.all():
            if template.template_file and template.template_file.hash:
                template.generate_price(self.prices_path)
        self.last_update=now() #todo test this piece of code and its repr
        self.save()

    class Meta:
        verbose_name = _('price')
        verbose_name_plural = _('Prices')

class PriceTemplate(models.Model):

    LANG_CHOICES = settings.LANGUAGES  + [('default','default')]

    price= ForeignKey(Price)
    site = CharField(max_length=15)
    language =  CharField(_("Template language"),max_length=15, choices=LANG_CHOICES, default='default', help_text=_("Choose language of document. If it is on default or universal language - choose default.") )

    #todo only odt
    #todo label of set template and modular inline
    #todo normal save
    template_file = ElfinderField(optionset='odt',blank=True, null=True)

    class Meta:
        verbose_name = _('price template')
        verbose_name_plural = _('Price templates')

    def generate_price(self, folder):
        res_path=path.join(folder, self.get_price_name())
        context=self.get_template_context()
        template=path.join(settings.PROJECT_PATH,self.template_file.url.replace('/','\\')[1:])
        renderer = Renderer(template, context, res_path,  overwriteExisting=True, pythonWithUnoPath='C:\\progra~2\\libreo~1.6\\program\\python.exe')
        renderer.run()
        #print "renderer  runned", template, res_path

    def get_template_context(self):
        all_products=Product.objects.filter(active=True)
        template_context={}


        for product in all_products:
            #to site cutting
            template_context[product.slug]=product.price(Site.objects.get(pk=self.site).site_cutting)

        return template_context


    def get_price_name(self):


        site='_'+Site.objects.get(pk=self.site).site_cutting

        if self.language=='default':
            language=''
        else:
            language='_'+self.language

        return self.price.name+site+language+'.pdf'
