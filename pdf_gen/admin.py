from django.contrib import admin
from django.contrib.admin import ModelAdmin, StackedInline, TabularInline
from models import Price, PriceTemplate
from django.forms import ChoiceField
from django.forms import ModelForm
from django.utils.translation import ugettext as _
from django.contrib.sites.models import Site

class PriceTemplateForm(ModelForm):
    SITE_CHOICES = [(site.pk, site.name) for site in Site.objects.all()]
    site = ChoiceField(label='site',choices=SITE_CHOICES,  initial='default', help_text=_("choose documnts site. If it is default or universal document - choose default") )

    class Meta:
            model = PriceTemplate

class PriceTemplateInline(StackedInline):
    model = PriceTemplate
    extra = 0
    verbose_name = _('Template')
    verbose_name_plural = _('Price odt templates')
    form = PriceTemplateForm



def update_price(modeladmin, request, queryset):
    for price in queryset:
        price.generate_new_prices()
update_price.short_description = _("update prices info")

class PriceAdmin(ModelAdmin):
    list_display = ('name', 'get_update_time')
    ordering = ['name']

    inlines = [PriceTemplateInline,]

    actions = [update_price]



admin.site.register(Price, PriceAdmin)


#save method
#plugin