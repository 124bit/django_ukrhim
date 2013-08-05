from django.utils.translation import ugettext as _

from cms.plugin_base import CMSPluginBase
from cms.plugin_pool import plugin_pool

from cmsplugin_plaintext.models import CMSCharFieldPlugin, CMSTextFieldPlugin

class CharFieldPlugin(CMSPluginBase):
    model = CMSCharFieldPlugin
    name = _('Text line')
    render_template = 'cmsplugin_plaintext/text.html'

    def render(self, context, instance, placeholder):
        context.update({
            'body': instance.body,
            'object': instance,
            'placeholder': placeholder
        })
        return context

class TextFieldPlugin(CMSPluginBase):
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
