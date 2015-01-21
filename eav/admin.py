#!/usr/bin/env python
# vim: ai ts=4 sts=4 et sw=4 coding=utf-8
#
#    This software is derived from EAV-Django originally written and 
#    copyrighted by Andrey Mikhaylenko <http://pypi.python.org/pypi/eav-django>
#
#    This is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Lesser General Public License as published
#    by the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This software is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Lesser General Public License for more details.
#
#    You should have received a copy of the GNU Lesser General Public License
#    along with EAV-Django.  If not, see <http://gnu.org/licenses/>.


from django.contrib import admin
from django.contrib.admin.options import (
    ModelAdmin, InlineModelAdmin
)
from django.forms.models import BaseInlineFormSet
from django.utils.safestring import mark_safe

from .models import Attribute
from django.utils.translation import ugettext as _
from django.utils.translation import get_language
from eav.models import Value
from django.conf import settings
class BaseEntityAdmin(ModelAdmin):
    
    def render_change_form(self, request, context, add=False, change=False, form_url='', obj=None):
        """
        Wrapper for ModelAdmin.render_change_form. Replaces standard static
        AdminForm with an EAV-friendly one. The point is that our form generates
        fields dynamically and fieldsets must be inferred from a prepared and
        validated form instance, not just the form class. Django does not seem
        to provide hooks for this purpose, so we simply wrap the view and
        substitute some data.
        """
        form = context['adminform'].form

        # infer correct data from the form
        fieldsets = self.fieldsets or [(None, {'fields': form.fields.keys()})]
        adminform = admin.helpers.AdminForm(form, fieldsets,
                                      self.prepopulated_fields)
        media = mark_safe(self.media + adminform.media)

        context.update(adminform=adminform, media=media)

        super_meth = super(BaseEntityAdmin, self).render_change_form
        return super_meth(request, context, add, change, form_url, obj)


class BaseEntityInlineFormSet(BaseInlineFormSet):
    """
    An inline formset that correctly initializes EAV forms.
    """
    def add_fields(self, form, index):
        if self.instance:
            setattr(form.instance, self.fk.name, self.instance)
            form._build_dynamic_fields()
        super(BaseEntityInlineFormSet, self).add_fields(form, index)


class BaseEntityInline(InlineModelAdmin):
    """
    Inline model admin that works correctly with EAV attributes. You should mix
    in the standard StackedInline or TabularInline classes in order to define
    formset representation, e.g.::

        class ItemInline(BaseEntityInline, StackedInline):
            model = Item
            form = forms.ItemForm

    .. warning: TabularInline does *not* work out of the box. There is,
        however, a patched template `admin/edit_inline/tabular.html` bundled
        with EAV-Django. You can copy or symlink the `admin` directory to your
        templates search path (see Django documentation).

    """
    formset = BaseEntityInlineFormSet

    def get_fieldsets(self, request, obj=None):
        if self.declared_fieldsets:
            return self.declared_fieldsets

        formset = self.get_formset(request)
        fk_name = self.fk_name or formset.fk.name
        kw = {fk_name: obj} if obj else {}
        instance = self.model(**kw)
        form = formset.form(request.POST, instance=instance)

        return [(None, {'fields': form.fields.keys()})]


def make_string(modeladmin, request, queryset):
    for attr in queryset:
        for value_obj in Value.objects.filter(attribute=attr):
            value_obj.value_text=str(value_obj.value)
            value_obj.save()
        attr.datatype=Attribute.TYPE_TEXT
        attr.save()
make_string.short_description = _("Change datatype to string")

def to_int_text(modeladmin, request, queryset):
    for attr in queryset:
        for value_obj in Value.objects.filter(attribute=attr):
            try:
                int_val=int(float(value_obj.value))
                value_obj.value_text=str(int_val)
                value_obj.save()
            except Exception,e:
                pass

to_int_text.short_description = _("To text without zeros")

class AttributeAdmin(ModelAdmin):
    list_filter = ['datatype']
    prepopulated_fields = {'slug': ('name_en',)}

    ordering=['name']
    list_display = ('name', 'units', 'slug', 'datatype', 'importance')
    actions = [make_string, to_int_text]

    fieldsets = (
        (None, {
            'fields': ['name_'+lang[0] for lang in settings.LANGUAGES] +['slug', 'datatype']
        }),
        (_('Additional options'), {
            'fields': ['units_'+lang[0] for lang in settings.LANGUAGES] + ['description_ru','description_en', 'importance', 'options']
        }),
        )
    def get_readonly_fields(self, request, obj=None):
        '''
        Override to make certain fields readonly if this is a change request
        '''
        if Value.objects.filter(attribute=obj).count()>0:
            return self.readonly_fields + ('datatype',)
        return self.readonly_fields






admin.site.register(Attribute, AttributeAdmin)


