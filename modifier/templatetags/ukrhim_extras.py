__author__ = 'Agafon'
from django import template
from product_db.models import Product
from eav.models import Attribute
from django.template import  Template
from django.http import Http404
from django.shortcuts import get_object_or_404
register = template.Library()
@register.filter
def get_item(dictionary, key):
    return dictionary[str(key)]

@register.filter
def get_attr(obj, key):
    return getattr(obj,key)

@register.filter
def arg(obj,key):
    return obj(key)

@register.filter
def dict_pop(obj,key):
    return obj.pop(key)

def make_list(*args):
    a=[]
    for arg in args:
        a.append(arg)
    return a
register.assignment_tag()(make_list)

def make_dict(**kwargs):
    return kwargs
register.assignment_tag()(make_dict)

def get_product(context):
    return get_object_or_404(Product,slug=context['request'].GET['product'])
register.assignment_tag(takes_context=True)(get_product)

def get_product_field(product, field_slug):
    try:
        res=getattr(product,field_slug)
    except:
        res=''
    return res
register.assignment_tag()(get_product_field)

def get_field_name(field_slug):
    return Attribute.objects.get(slug=field_slug).name
register.simple_tag(get_field_name)

def get_field_units(field_slug):
    units=Attribute.objects.get(slug=field_slug).units
    if units:
        return units
    else:
        return ''
register.simple_tag(get_field_units)

@register.filter
def make_dict(key, val):
    return {key:val}

@register.filter
def stringify(key):
    return str(key)

def bread_crumbs(context):
    return context
register.inclusion_tag('breadcrumb.html', takes_context=True)(bread_crumbs)

def render_text(context,text):
    return Template(text).render(context)
register.simple_tag(takes_context=True)(render_text)

class RangeNode(template.Node):
    def __init__(self, parser, range_args, context_name):
        self.template_parser = parser
        self.range_args = range_args
        self.context_name = context_name

    def render(self, context):

        resolved_ranges = []
        for arg in self.range_args:
            compiled_arg = self.template_parser.compile_filter(arg)
            resolved_ranges.append(int(compiled_arg.resolve(context, ignore_failures=True))+1)
        context[self.context_name] = list(range(*resolved_ranges))
        return ""

@register.tag
def mkrange(parser, token):
    """
    Accepts the same arguments as the 'range' builtin and creates
    a list containing the result of 'range'.

    Syntax:
        {% mkrange [start,] stop[, step] as context_name %}

    For example:
        {% mkrange 5 10 2 as some_range %}
        {% for i in some_range %}
          {{ i }}: Something I want to repeat\n
        {% endfor %}

    Produces:
        5: Something I want to repeat
        7: Something I want to repeat
        9: Something I want to repeat
    """

    tokens = token.split_contents()
    fnctl = tokens.pop(0)

    def error():
        raise template.TemplateSyntaxError, "%s accepts the syntax: {%% %s [start,] " +\
                "stop[, step] as context_name %%}, where 'start', 'stop' " +\
                "and 'step' must all be integers." %(fnctl, fnctl)

    range_args = []
    while True:
        if len(tokens) < 2:
            error()

        token = tokens.pop(0)

        if token == "as":
            break

        range_args.append(token)

    if len(tokens) != 1:
        error()

    context_name = tokens.pop()

    return RangeNode(parser, range_args, context_name)


