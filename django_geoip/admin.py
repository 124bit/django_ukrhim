from models import *
from django.contrib import admin
from django.contrib.admin import ModelAdmin, StackedInline, TabularInline
from django import forms
from django.contrib.admin.widgets import FilteredSelectMultiple
from django.utils.translation import ugettext as _
class CustomRegionForm(forms.ModelForm):
    class Meta:
        model = CustomRegion

    cities = forms.ModelMultipleChoiceField(queryset=City.objects.all(), widget=FilteredSelectMultiple(
            verbose_name=_('Cities'),
            is_stacked=False
        ))
    def __init__(self, *args, **kwargs):
        super(CustomRegionForm, self).__init__(*args, **kwargs)
        if self.instance:
            self.fields['cities'].initial = self.instance.city_set.all()

    def save(self, *args, **kwargs):
        # FIXME: 'commit' argument is not handled
        # TODO: Wrap reassignments into transaction
        # NOTE: Previously assigned Foos are silently reset
        instance = super(CustomRegionForm, self).save(commit=False)
        self.fields['cities'].initial.update(custom_region=None)
        self.cleaned_data['cities'].update(custom_region=instance)
        return instance    
    
class CustomRegionAdmin(ModelAdmin):
    form = CustomRegionForm
    
    
admin.site.register(CustomRegion, CustomRegionAdmin)