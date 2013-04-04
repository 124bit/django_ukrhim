__author__ = 'Agafon'
from django.template import Context, Template, TemplateSyntaxError
from django.contrib.sites.models import Site

def render_with_tags(instance, placeholder, rendered_content, original_context):
    '''
    plugin processor fuction. Changes any plugins output. Renders output as django template,
    with context:
    'site': current site cutting
    'current cutting': 1 (for simple site detection with template if tag)
    '''


    #if error show it only in admin
    try:
        plugin_text=Template(rendered_content)
    except TemplateSyntaxError, exc_text:
        if original_context['request'].path.startswith('/admin'):
            return  exc_text
        else:
            return ''

    plugin_context_dict={
        'site': Site.objects.get_current().cutting,
        Site.objects.get_current().cutting : 1,
            }

    plugin_context = Context(plugin_context_dict)

    return  plugin_text.render(plugin_context)
