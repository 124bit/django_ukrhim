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
from cms.templatetags.cms_tags import get_placeholder
from cms.templatetags.cms_tags import get_page
from django.contrib.sites.models import Site
from datetime import datetime 
import datetime as datetime_ 
from django.db.models import Max
from django_geoip.models import CustomRegion
from os import path
import re
import pytz

register = template.Library()

def rupluralize(value, endings):
        endings = endings.split(',')
        try:
            value=int(value)
            if value % 100 in (11, 12, 13, 14):
                return endings[2]
            elif value % 10 == 1:
                return endings[0]
            elif value % 10 in (2, 3, 4):
                return endings[1]
            else:
                return endings[2]
        except:  
            if '/' in unicode(value):
                return endings[1]
            else:
                return endings[1]
            
        
        

register.simple_tag(rupluralize)


def add_subd(context, obj):
    subdomain=context['request'].META['HTTP_HOST']
    if subdomain[:4]=='www.':
        subdomain=subdomain[4:]
    if subdomain.count('.')>=2:
        subdomain=subdomain[:subdomain.find('.')]
    else:
        subdomain=''
    if subdomain:
        return obj[:obj.find('/')+2]+subdomain+'.'+obj[obj.find('/')+2:]
    else:
        return obj 
register.simple_tag(takes_context=True)(add_subd)

@register.filter
def split(obj, key):
    return obj.split(key)

@register.filter
def repl_product_page(obj):
    return obj.replace('product_page','products/product')

@register.filter    
def if_number(obj):
    try:
        float(obj.replace(' ','').replace(',','.'))
        return True
    except:
        return False
    
    
@register.filter
def get_index_1(lst, key):
    return lst[int(key)-1]    
    
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
def dict_del(obj,key):
    obj.pop(key)
    return '' 
    
@register.filter
def pname_foramtter(name):
    name.replace('-', ' - ',1)
    return name.replace('-', ' - ',1)
    
@register.filter
def make_dict(key, val):
    return {key:val}

    
from itertools import izip

def pairwise(t):
    it = iter(t)
    return izip(it,it)    
    
def make_ordered_dict(*key):    
    return OrderedDict(pairwise(key))
register.assignment_tag(make_ordered_dict)
 
@register.filter
def del_style(val):
    pos1=val.find('<style')
    pos2=val.find('/style')+7
    if pos1!=-1 and pos2!=-1:
        return val[:pos1]+ val[pos2:]
    else:
        return val
@register.filter
def add_extends(val,param):
    if  val:
        return '{% extends ' + param+ ' %}'+'\n'+unicode(val)
    else:
        return '{% extends ' + param+ ' %}'+'\n'
    
    
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

def thous(x, sep=' ', dot='.'):
    num, _, frac = str(x).partition(dot)
    num = re.sub(r'(\d{3})(?=\d)', r'\1'+sep, num[::-1])[::-1]
    if frac:
        num += dot + frac
    return num    
    
@register.filter
def format_price_str(price_str):
    try:
        price_str=thous(price_str)
        return price_str
        
    except: #i dont now why it puts elfinder so no exc
        return price_str



def count_min_height(html, h, offset):
    return(html.count('li')/2*int(h)+offset)
register.assignment_tag()(count_min_height)           

@register.filter
def to_cm(text):
    try:
        fl_text = float(text)/10
        if fl_text.is_integer():
            fl_text=int(fl_text)
    except ValueError:
        return text
    return unicode(fl_text).replace(',','.')
    
@register.filter
def to_m(text):
    try:
        fl_text = float(text)/1000
        if fl_text.is_integer():
            fl_text=int(fl_text)
    except ValueError:
        return text
    return unicode(fl_text).replace(',','.')    

    
def method(obj,method,key):
    return getattr(obj,method)(key) 
register.simple_tag(method)


def photo_prof(string):
    if string:
        return 'face_in_products_'+str(string)
    else:
        return 'face_in_products_2'
register.assignment_tag()(photo_prof)


def make_list(*args):
    a=[]
    for arg in args:
        a.append(arg)
    return a
register.assignment_tag()(make_list)



def make_dict(**kwargs):
    return kwargs
register.assignment_tag()(make_dict)

def make_str(string): #???wtf???
    return string
register.assignment_tag(make_str)

def make_template(string):
    return  Template(string)
register.assignment_tag(make_template)   



def req_get(context):
    return str(context['request'].GET)
register.assignment_tag(takes_context=True)(req_get)




def is_draft(context):
    if 'draft' in context['request'].GET and context['request'].GET['draft']:
        return 1
    else:
        return 0
register.assignment_tag(takes_context=True)(is_draft)

def first_time(context):
    if context['site_cutting']+'_first_visit' in context['request'].COOKIES:
        return False
    else:
        return True
register.assignment_tag(takes_context=True)(first_time)

def visit_number(context):
    if context['site_cutting']+'_visit_num' in context['request'].COOKIES:
        try:
            return int(context['request'].COOKIES[context['site_cutting']+'_visit_num'])
        except:
            return 0
    else:
        return 0
register.assignment_tag(takes_context=True)(visit_number) 


def if_main(context):
    if context['request'].current_page.reverse_id == "main":
        return True
    else:
        return False
register.assignment_tag(takes_context=True)(if_main)


def cache_version(context, version):
    if 'draft' in context['request'].GET and context['request'].GET['draft']:
        return datetime.now()
    else:
        return version
register.assignment_tag(takes_context=True)(cache_version)




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
        if photo.slug:
            photos.append(photo)
    #photos.sort(key=lambda x: x.inline_ordering_position)
    return photos
register.assignment_tag()(get_album_photos)

def get_album_videos(slug):
    videos=[video for video in Album.objects.get(slug=slug).video_set.all()]
    
    return videos

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


def product_first_price(context, product):
    return product.price(price_index=0, lang=context['LANGUAGE_CODE'])
register.assignment_tag(takes_context=True)(product_first_price)

def product_second_price(context, product):
    return product.price(price_index=1, lang=context['LANGUAGE_CODE'])
register.assignment_tag(takes_context=True)(product_second_price)



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


def get_product_type(type_slug):
    return ProductType.objects.get(slug=type_slug)
    
register.assignment_tag(get_product_type)

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
    res=[]
    
    if ':' in names:
        args=names.split(':')
        start=False
        if not args[0]:
            start=True
        for product in products.values():
            if args[0] and product.slug==args[0]:
                start=True
            if start:
                res.append((product.slug, product))
            if args[1] and product.slug==args[1]:
                return OrderedDict(res)
        return OrderedDict(res)
    elif 'all' == names:
        return products
    else:
        args=names.split(' ')
        for arg in args:
            if arg in products:
                res.append((arg, products[arg]))
        return OrderedDict(res)
register.assignment_tag()(get_some)


def compare_time(h_start, m_start, h_end, m_end):
    now = datetime.now()
    call_us_now = False
    if now.weekday() != 6 and now.weekday() != 5:
        if (h_start < now.hour < h_end): 
            call_us_now = True
        elif h_start == now.hour and now.minute >  m_start:
            call_us_now = True
        elif h_end == now.hour and now.minute < m_end:
            call_us_now = True
    return call_us_now
register.assignment_tag(compare_time)  
   
def call_date(h_end, m_end):
    now = datetime.today()
    
    
    if now.weekday() == 5:
        tomorrow=now + datetime_.timedelta(days=2)
    elif now.weekday() == 4:
        tomorrow=now + datetime_.timedelta(days=3)
    else:
        tomorrow=now + datetime_.timedelta(days=1)
    

    
    if  (h_end < now.hour or (h_end == now.hour and m_end < now.minute)) or now.weekday() == 5 or now.weekday() == 6:
        call_date = tomorrow
    else:
        call_date = now
        
    return call_date.strftime("%d.%m.%y")
register.simple_tag(call_date)   
    
   
def change_item(slugs, products, field, value):
    products=get_some(slugs, products)
    value=unicode(value)
    for product in products.values():
        old_value=unicode(getattr(product,field))
        
        if '{}' in value:
            new_value= value.replace('{}',old_value)
        else:
            new_value= value
        setattr(product,field, mark_safe(new_value)) 
    return ''
register.simple_tag()(change_item)


def get_doc_pages(context, main_page):
    pages=main_page.get_descendants().filter(reverse_id__startswith='instr__', published=True)
    #pages_dict={ page.reverse_id:page for page in pages if page.published}
    #instr_pages=[]
    #for id, page in pages_dict.items():
    #    if id.startswith('instr__'):
    #        instr_pages.append(page)
    return pages
register.assignment_tag(takes_context=True)(get_doc_pages)

def get_product_info (context,reverse_id_start, product, category_page):
    pages=category_page.get_children()
    pages_dict={ page.reverse_id:page for page in pages if page.published}
    
    if product.slug == 'well_pe_kl_660' and context['request'].GET['product_type'] == 'sewerage_wells':
        return get_placeholder(context,'content',pages_dict['instr__sewerage_wells'])
    
    product_id=reverse_id_start+'__'+product.slug
    for id in pages_dict:
        if id==product_id:
            return get_placeholder(context,'content',pages_dict[id])
            
    
    type_id=reverse_id_start+'__'+product.product_type.slug
    for id in pages_dict:
        if id==type_id:
            return get_placeholder(context,'content',pages_dict[id])
    
    parent_id=reverse_id_start+'__'+category_page.reverse_id
    for id in pages_dict:
        if id==parent_id:
            return get_placeholder(context,'content',pages_dict[id])
    
    return ''
register.assignment_tag(takes_context=True)(get_product_info)


def get_product_info_tab_name (context,reverse_id_start, product, category_page):
    pages=category_page.get_children()
    pages_dict={ page.reverse_id:page for page in pages if page.published}
    
    product_id=reverse_id_start+'__'+product.slug
    for id in pages_dict:
        if id==product_id:
            try:
                return get_placeholder(context,'tab name',pages_dict[id])
            except:
                return None 
            
    
    type_id=reverse_id_start+'__'+product.product_type.slug
    for id in pages_dict:
        if id==type_id:
            try:
                return get_placeholder(context,'tab name',pages_dict[id])
            except:
                return None 
    
    parent_id=reverse_id_start+'__'+category_page.reverse_id
    for id in pages_dict:
        if id==parent_id:
            try:
                return get_placeholder(context,'tab name',pages_dict[id])
            except:
                return None 
    
    return ''
register.assignment_tag(takes_context=True)(get_product_info_tab_name)


def get_sites():
    return Site.objects.all()
register.assignment_tag()(get_sites)

def get_site(site_cutting):
    return Site.objects.get(site_cutting=site_cutting)
    
register.assignment_tag()(get_site)
def get_product_sales (context, product, category_page):
    pages=get_page(context,'news_list').get_children()
    pages_dict={ page.reverse_id:page for page in pages if page.published}
    
    sales=[]
    product_id=product.slug
    for id in pages_dict:
        if 'sale__' in id and product_id in id:
            sales.append(pages_dict[id])
            
    
    type_id=product.product_type.slug
    for id in pages_dict:
        if 'sale__' in id and type_id in id:
            sales.append(pages_dict[id])
    
    parent_id=category_page.reverse_id
    for id in pages_dict:
        if 'sale__' in id and parent_id in id:
            sales.append(pages_dict[id])
    return sales
register.assignment_tag(takes_context=True)(get_product_sales)

def get_child_photo_url(url):
    if url:
        return url.replace('_face','')
    else:
        return 'no_url'
register.assignment_tag()(get_child_photo_url)

def get_section_name(section, menu_items):
    for item in menu_items:
        if 'page_section' in item and item['page_section'] == section:
            return item['long_name']
    for item in menu_items:
        if 'product_type' in item and item['product_type'] == section:
            return item['long_name']
register.simple_tag()(get_section_name)


def set_goal(context, goal_name, append_reverse_id= False):
    res=goal_name
    if append_reverse_id:
        res = res + '_'+context['request'].current_page.reverse_id
    return "metrikaReach('"+res+"'); ga('send', 'pageview', {'page': '/"+res+"','title': 'my overridden page'});"
register.simple_tag(takes_context=True)(set_goal)





def company_name():
	return Site.objects.get_current().company
register.simple_tag()(company_name)

def get_page_section(context):
    request=context['request']
    if 'page_section' in request.GET:
        return request.GET['page_section']
    elif 'product_type' in request.GET:
        return request.GET['product_type']
register.assignment_tag(takes_context=True)(get_page_section)


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

def get_default_lang():
    return settings.LANGUAGE_CODE
register.assignment_tag()(get_default_lang)

def replace_url_language_code(context, code):
    current_langp='/'+context['request'].LANGUAGE_CODE+'/'
    if code != settings.LANGUAGE_CODE:
        needed_langp='/'+code+'/'
    else:
        needed_langp='/'
    
    current_path=context['request'].get_full_path()
    
    if context['request'].LANGUAGE_CODE != settings.LANGUAGE_CODE:
        return current_path.replace(current_langp,needed_langp,1)
    else:
        return current_path.replace('/',needed_langp,1)

register.simple_tag(takes_context=True)(replace_url_language_code)
    
    
def bread_crumbs(context):
    return context
register.inclusion_tag('breadcrumb.html', takes_context=True)(bread_crumbs)

def get_lastchng_prdt(menu_items):
    type_slugs=[]
    for item in menu_items:
        if 'product_type' in item:
            type_slugs.append(item['product_type'])
    types=ProductType.objects.filter(slug__in=type_slugs)
    dates=[]
    for type in types:
        dates.append(type.changed)
    if dates:
        return max(dates)
    else:
        return '_'
register.assignment_tag()(get_lastchng_prdt)

def maximum_val(*args):
    utc=pytz.UTC
    comp=list(args)
    if '_' in comp:
        comp.remove('_')
    new_comp = []
    for el in comp:
        try:
            new_comp.append(utc.normalize(el))
        except ValueError:
            new_comp.append(el.replace(tzinfo=pytz.UTC))
       
    return max(new_comp)
	
register.assignment_tag()(maximum_val)


def get_site_media_css(context):
    try:
        if path.exists(settings.PROJECT_PATH+'/media/files/site_static/catalog/user_media_'+context['site_cutting']+'.css'):
            return 'user_media_'+context['site_cutting']+'.css'
    except KeyError:
        pass
register.assignment_tag(takes_context=True)(get_site_media_css)

def get_product_page(context):
    product=context['product']
    
    
    
    
    try:
        type_descr=product.product_type.type_description.strip()
    except:
        type_descr=''
    if not type_descr:
            type_descr = "{% block type_description %}{% endblock %}"
    
    
    try:
        product_descr=product.descr_m.strip()
    except:
        product_descr=''
    if not product_descr:
        product_descr="{% block product_description %}{% block type_description %}{% endblock %}{% endblock %}"
        
    try:
        product_template=product.template.strip()
    except:
        product_template=''
    
    if product_template:
        template=product_template
    elif product.product_type.template.strip():
        template = product.product_type.template
    else:
        template = "{% block left_content %}{% block product_description %}{% endblock %}{{ block.super }}{% endblock %}"
        

    #raise Exception
    
    type_descr=add_extends(type_descr,'product_descr')
    product_descr=add_extends(product_descr,'template')
    template=add_extends(template,'"product_common.html"')
    
    
    context['template']=Template(template)
    context['product_descr']=Template(product_descr)
    
    return Template(type_descr).render(context)
    
register.simple_tag(takes_context=True)(get_product_page)


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


def seo_href_loc():
    return ''
register.simple_tag(seo_href_loc)    

def subdomain_region(context):
       
    return CustomRegion.objects.get(slug=context['loc']).city_set.all()[0].region.name
register.simple_tag(takes_context=True)(subdomain_region)  


