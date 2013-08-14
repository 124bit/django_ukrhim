from django.utils.translation import ugettext as _

from cms.plugin_base import CMSPluginBase
from cms.plugin_pool import plugin_pool

from cmsplugin_plaintext.models import CMSCharFieldPlugin, CMSTextFieldPlugin


from django_ace import AceWidget
from django import forms

from django.db import models


class CMSTextFieldPluginForm(forms.ModelForm):
    body = forms.CharField(widget=AceWidget(mode='html', wordwrap=True, theme='eclipse'))
    class Meta:
        model = CMSTextFieldPlugin



class CharFieldPlugin(CMSPluginBase):
    model = CMSCharFieldPlugin
    name = _('Text line')
    render_template = 'cmsplugin_plaintext/text.html'
    formfield_overrides = {
        models.CharField: {'widget': forms.TextInput(attrs={'size':'80'})}
    }

    def render(self, context, instance, placeholder):
        context.update({
            'body': instance.body,
            'object': instance,
            'placeholder': placeholder
        })
        return context

class TextFieldPlugin(CMSPluginBase):
    form =  CMSTextFieldPluginForm
    model = CMSTextFieldPlugin
    name = _('Text area')
    render_template = 'cmsplugin_plaintext/text.html'

    def render(self, context, instance, placeholder):
        context.update({
            'body': instance.body,
            'object': instance,
            'placeholder': placeholder
        })
        return context

plugin_pool.register_plugin(CharFieldPlugin)
plugin_pool.register_plugin(TextFieldPlugin)
