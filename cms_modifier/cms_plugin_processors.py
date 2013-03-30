__author__ = 'Agafon'
from django.http import Http404
from django.template import Context, Template
from django.contrib.sites.models import Site
from django import template

##TODO: vivod oshibki tolko vnutri + norm oshibka 503 + proverka vvoda cutting latinicej
def render_with_tags(instance, placeholder, rendered_content, original_context):
    try:
        t=Template(rendered_content)
    except template.TemplateSyntaxError,e:
        return '503 server error : ', str(e)

    t = Template(rendered_content)
    c_dict={
        'site': Site.objects.get_current().cutting,
        Site.objects.get_current().cutting : 1,
            }

    c = Context(c_dict)

    return  t.render(c)
