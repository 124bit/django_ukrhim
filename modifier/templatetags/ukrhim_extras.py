__author__ = 'Agafon'
from django import template
from product_db.models import Product, ProductType
from eav.models import Attribute
from django.template import  Template, Context
from django.http import Http404
from django.shortcuts import get_object_or_404
from ukrhim_gallery.models import Album
from collections import OrderedDict
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

@register.filter
def pname_foramtter(name):
    name.replace('-', ' - ',1)
    return name.replace('-', ' - ',1)

def make_list(*args):
    a=[]
    for arg in args:
        a.append(arg)
    return a
register.assignment_tag()(make_list)

def make_dict(**kwargs):
    return kwargs
register.assignment_tag()(make_dict)

def get_albums():
    return Album.objects.all()
register.assignment_tag()(get_albums)

def get_album_photos(slug):
    photos=[]
    for photo in Album.objects.get(slug=slug).media_set.all():
        if photo.slug[:4]!='http':
            photos.append(photo)
    return photos
register.assignment_tag()(get_album_photos)

def get_album_videos(slug):
    photos=[]
    for photo in Album.objects.get(slug=slug).media_set.all():
        if photo.slug[:4] == 'http':
            photos.append(photo)
    return photos

register.assignment_tag()(get_album_videos)

def type_products(type_slug):
    products=ProductType.objects.get(slug=type_slug).product_set.all()
    products_list=[]
    for product in products:
        products_list.append((product.slug, product))
    return OrderedDict(products_list)
register.assignment_tag(type_products)

def add_to_item(products,slug,field, value):
    value=str(value)
    old_value=getattr(products[slug],field)
    setattr(products[slug],field, str(old_value)+value)
register.simple_tag(add_to_item)

def get_type_and_addtnl_products(product, product_type_slug=None):
    if product_type_slug:
        return ProductType.objects.get(slug=product_type_slug).get_products_of_type_and_accessoires()
    else:
        return product.product_type.get_products_of_type_and_accessoires()
register.assignment_tag(get_type_and_addtnl_products)

def change_item(products,slug,field, value):
    value=str(value)
    old_value=str(getattr(products[slug],field))
    if '{}' in value:
        new_value= value.replace('{}',old_value)
    else:
        new_value= value
    setattr(products[slug],field, new_value)
register.simple_tag(change_item)

def get_product(context):
    return get_object_or_404(Product,slug=context['request'].GET['product'])
register.assignment_tag(takes_context=True)(get_product)

def parse_tmpl(tmpl,**kwargs):
    return Template(tmpl).render(Context(kwargs))
register.simple_tag(parse_tmpl)

def make_str(string):
    return string
register.assignment_tag(make_str)
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
    if key:
        return str(key)
    else:
        return ''

@register.filter
def unicodify(key):
    if key:
        return unicode(key)
    else:
        return ''


@register.filter
def intify(key):
    return int(key)

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


