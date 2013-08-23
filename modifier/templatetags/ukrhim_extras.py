__author__ = 'Agafon'
from django import template
from product_db.models import Product, ProductType
from eav.models import Attribute
from django.template import  Template, Context
from django.http import Http404
from django.shortcuts import get_object_or_404
from ukrhim_gallery.models import Album
from collections import OrderedDict
import platform
from django.conf import settings
from django.utils.safestring import mark_safe
from django.contrib.sites.models import Site
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



    
    

def make_list(*args):
    a=[]
    for arg in args:
        a.append(arg)
    return a
register.assignment_tag()(make_list)

def make_dict(**kwargs):
    return kwargs
register.assignment_tag()(make_dict)

def make_str(string):
    return string
register.assignment_tag(make_str)





def parse_tmpl_cont(context, templ):
    return Template(templ).render(context)
register.simple_tag(takes_context=True)(parse_tmpl_cont)

def parse_tmpl(tmpl,**kwargs):
    return Template(tmpl).render(Context(kwargs))
register.simple_tag(parse_tmpl)

def render_text(context,text):
    return Template(text).render(context)
register.simple_tag(takes_context=True)(render_text)




def get_albums():
    return Album.objects.all()
register.assignment_tag()(get_albums)

def get_album_name(slug):
    return Album.objects.get(slug=slug).name()

register.simple_tag()(get_album_name)

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











def get_product(context, slug=None):
    if slug:
        return Product.objects.get(slug=slug)
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




def type_products(type_slug, only_active=True, only_sites=True):
    if only_active:
        products=ProductType.objects.get(slug=type_slug).product_set.filter(active=True)
    else: 
        products=ProductType.objects.get(slug=type_slug).product_set.all()
       
    products_list=[]
    for product in products:
        if only_sites:
            cur_site=Site.objects.get_current().site_cutting
            try:
                if cur_site not in product.include_on_sites:
                    continue
            except:
                pass
                
            try:
                if cur_site in product.exclude_on_sites:
                    continue
            except:
                pass

            products_list.append((product.slug, product))
        else:
            products_list.append((product.slug, product))
    return OrderedDict(products_list)
register.assignment_tag(type_products)

def get_type_name(slug):
    return ProductType.objects.get(slug=slug).name
register.simple_tag(get_type_name)

def get_type_and_addtnl_products(product=None, product_type_slug=None):
    if product_type_slug:
        return ProductType.objects.get(slug=product_type_slug).get_products_of_type_and_accessoires()
    else:
        return product.product_type.get_products_of_type_and_accessoires()
register.assignment_tag(get_type_and_addtnl_products)

def get_some(names, products):
    args=names.split(' ')
    res=[]
    for arg in args:
        if arg in products:
            res.append((arg, products[arg]))
    return OrderedDict(res)
register.assignment_tag()(get_some)

def add_to_item(products,slug,field, value):
    value=str(value)
    old_value=getattr(products[slug],field)
    setattr(products[slug],field, str(old_value)+value)
register.simple_tag(add_to_item)

def change_item(products,slug,field, value):
    value=str(value)
    old_value=str(getattr(products[slug],field))
    if '{}' in value:
        new_value= value.replace('{}',old_value)
    else:
        new_value= value
    setattr(products[slug],field, new_value)
    return ''
register.simple_tag()(change_item)


def get_child_photo_url(url):
    if url:
        return url.replace('_face','')
    else:
        return 'no_url'
register.assignment_tag()(get_child_photo_url)


def get_menu_items_from_txt(pls):
    items=[]
    item={}
    for txt_str in pls.split('\r\n'):
        if '=' in txt_str:
            kwarg=txt_str.split('=')
            item[str(kwarg[0]).strip(' ')]=mark_safe(kwarg[1].strip(' '))
        if txt_str.strip(' ')==';':
            if item:
                items.append(item)
            item={}    
    return items
register.assignment_tag()(get_menu_items_from_txt)


def replace_url_language_code(context, code):
    return context['request'].get_full_path().replace('/'+context['request'].LANGUAGE_CODE+'/','/'+code+'/')
register.simple_tag(takes_context=True)(replace_url_language_code)
    
    
def bread_crumbs(context):
    return context
register.inclusion_tag('breadcrumb.html', takes_context=True)(bread_crumbs)



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


