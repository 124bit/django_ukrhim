__author__ = 'Agafon'
from cms.plugin_base import CMSPluginBase
from cms.plugin_pool import plugin_pool
from django.utils.translation import ugettext_lazy as _
from .models import ElfinderFileHolder, ElfinderPictureHolder
from django.conf import settings

class ElfinderFilePlugin(CMSPluginBase):
    model = ElfinderFileHolder
    name = _("File plugin")
    render_template = "file_plugin_templ.html"
    text_enabled = True


    def render(self, context, instance, placeholder):
        context['instance'] = instance
        return context

plugin_pool.register_plugin(ElfinderFilePlugin)

class ElfinderImagePlugin(CMSPluginBase):

    model = ElfinderPictureHolder
    name = _("Picture plugin")
    render_template = "image_plugin_templ.html"
    text_enabled = True

    def render(self, context, instance, placeholder):

        tags=' '.join(instance.html_tags.split('\n'))

        url='"'+instance.file_field.url+'"'
        if instance.logic=='1':
            if instance.generator:
                if instance.html_tags.split('\n')[0]!='':
                    tags=' -- ' +tags
                else:
                    tags=''

                res='{% load imagekit %}  {% generateimage "'+instance.generator.name+'" source='+ url  + tags+ ' %}'
            else:
                res='[select generator for '+url+']'

        elif instance.logic=='3':
            res='<img '+'src='+ url +' '+tags+ '>'

        elif instance.logic=='2':
            res='{% load imagekit %}  {% generateimage "'+instance.generator.name+'" source='+ url +' -- no_tag=1'+  ' %}'
        elif instance.logic=='5':
            if instance.generator and instance.var_name:
                res='{% load imagekit %} {% generateimage "'+instance.generator.name+'" source='+ url +' as  ' +instance.var_name+' %}'
            else:
                res='select generator and instance name'
        elif instance.logic=='4':
                res=url
        context['result'] = res
        return context



plugin_pool.register_plugin(ElfinderImagePlugin)