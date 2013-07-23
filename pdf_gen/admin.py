from django.contrib import admin
from django.contrib.admin import ModelAdmin, StackedInline, TabularInline
from models import Price, PriceTemplate
from django.forms import ChoiceField
from django.forms import ModelForm
from django.utils.translation import ugettext as _
from django.contrib.sites.models import Site
from eav.models import Attribute
from time import sleep
import platform
import subprocess
class PriceTemplateForm(ModelForm):

    PRICE_FIELD_CHOICES=[]
    for attr in Attribute.objects.all():
            if 'price_field' in attr.options:
                PRICE_FIELD_CHOICES.append((attr.slug, attr.name_en))

    SITE_CHOICES = [(site.pk, site.name) for site in Site.objects.all()]
    site = ChoiceField(label=_('Site'),choices=SITE_CHOICES,  initial='default', help_text=_("Select price field. Template would be filled by prices from this field.") )
    price_field= ChoiceField(label=_('Site'),choices=PRICE_FIELD_CHOICES,  initial='default', help_text=_("Choose site of document."))

    class Meta:
            model = PriceTemplate

class PriceTemplateInline(StackedInline):
    model = PriceTemplate
    extra = 0
    verbose_name = _('Template')
    verbose_name_plural = _('Price odt templates')
    form = PriceTemplateForm



def update_price(modeladmin, request, queryset):
    if platform.system() == 'Linux':
        proc=subprocess.Popen('soffice --invisible --headless "--accept=socket,host=localhost,port=2002;urp;"', shell=True)
        sleep(7)
        
    for price in queryset:
        price.generate_new_prices()
    if platform.system() == 'Linux':
        proc.terminate()
update_price.short_description = _("Update prices info")

class PriceAdmin(ModelAdmin):
    list_display = ('name', 'get_update_time')
    ordering = ['name']

    inlines = [PriceTemplateInline,]

    actions = [update_price]



admin.site.register(Price, PriceAdmin)


#save method
#plugin