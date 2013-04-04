__author__ = 'Agafon'
from cms.plugin_base import CMSPluginBase
from cms.plugin_pool import plugin_pool
from cms.models.pluginmodel import CMSPlugin
from django.utils.translation import ugettext_lazy as _
from models import*

class ElfinderFilePlugin(CMSPluginBase):
    model = ElfinderFileHolder
    name = _("File plugin")
    render_template = "file_plugin_templ.html"

    def render(self, context, instance, placeholder):
        return context

plugin_pool.register_plugin(ElfinderFilePlugin)