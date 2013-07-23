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
from django import forms
from eav.models import Attribute
from eav.fields import EavSlugField
from django.contrib.admin.models import LogEntry, CHANGE
import platform
import subprocess

class Price(models.Model):
    prices_path=path.join('django_ukrhim/media/files','generated_prices')

    name=EavSlugField(_("Document name"), max_length=50, help_text=_("Use this name like '{% load price_file %} {% price_file site='auto' lang='auto' %}'." ),
                   unique=True)
    last_update= DateTimeField(_("Last document update"), default=datetime(1980,2,2), editable=False)


    #todo show normal datetime everywhere
    def get_update_time(self):
        if self.last_update.year==1980:
            return _("price list never generated")
        else:
            return self.last_update
    get_update_time.short_description = _("Update time")

    def generate_new_prices(self):
        log='pdf prices update: '
        for template in self.pricetemplate_set.all():
            if template.template_file and template.template_file.hash:
               template.generate_price(self.prices_path)
               log+=template.get_price_name()+' '
        self.last_update=now() #todo test this piece of code and its repr


        LogEntry.objects.log_action(
            user_id         = 1,
            content_type_id = None,
            object_id       = None,
            object_repr     = log,
            action_flag     = CHANGE
        )

        self.save()

    class Meta:
        verbose_name = _('price list')
        verbose_name_plural = _('Price lists')






class PriceTemplate(models.Model):

    LANG_CHOICES = settings.LANGUAGES  + [('default','default')]

    price_field= CharField(max_length=40, blank=True, null=True)
    price= ForeignKey(Price, blank=True, null=True)
    site = CharField(max_length=15)
    language =  CharField(_("Template language"),max_length=15, choices=LANG_CHOICES, default='default', help_text=_("Choose language of document. If it is on default or universal language - choose default.") )

    #todo only odt
    #todo label of set template and modular inline
    #todo normal save
    template_file = ElfinderField(blank=True, null=True, help_text=_("Choose ODT price list template."))

    class Meta:
        verbose_name = _('price template')
        verbose_name_plural = _('Price templates')

    def generate_price(self, folder):
        res_path=path.join(folder, self.get_price_name())
        context=self.get_template_context()
        if platform.system() == 'Linux':
            template='django_ukrhim/'+self.template_file.url

            proc=subprocess.Popen('soffice --invisible --headless "--accept=socket,host=localhost,port=2002;urp;"')
            renderer = Renderer(template, context, res_path,  overwriteExisting=True)
            renderer.run()
            proc.terminate()
        else:
            template=path.join(settings.PROJECT_PATH,self.template_file.url.replace('/','\\')[1:])
            renderer = Renderer(template, context, res_path,  overwriteExisting=True, pythonWithUnoPath='C:\\progra~2\\libreo~1.6\\program\\python.exe')
            renderer.run()
        #print "renderer  runned", template, res_path

    def get_template_context(self):
        all_products=Product.objects.filter(active=True)
        template_context={}
        for product in all_products:
            price_string=product.price(price_slug=self.price_field)
            if price_string!='':
                template_context[product.slug+'__price']=format(price_string, ".2f")
            else:
                template_context[product.slug+'__price']=price_string
            for field in product.additional_fields.all():
                if field.datatype==Attribute.TYPE_TEXT or field.datatype==Attribute.TYPE_FLOAT or field.datatype==Attribute.TYPE_DATE:
                    template_context[product.slug+'__'+field.slug]=getattr(product,field.slug)
            print template_context
        return template_context


    def get_price_name(self):


        site='_'+Site.objects.get(pk=self.site).site_cutting

        if self.language=='default':
            language=''
        else:
            language='_'+self.language

        return self.price.name+site+language+'.pdf'
