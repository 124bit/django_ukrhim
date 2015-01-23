# -*- coding: utf-8 -*-
from django.db import models
from elfinder.fields import ElfinderField
from django.contrib.sites.models import Site
from django.utils.translation import ugettext as _
from django.db.models import SlugField, ForeignKey, DateTimeField, CharField, TextField
from appy.pod.renderer import Renderer
from os import path
from product_db.models import Product, ProductTag, ProductType
from datetime import datetime
from django.utils.timezone import now
from eav.models import Attribute
from eav.fields import EavSlugField
from django.contrib.admin.models import LogEntry, CHANGE
import platform
import re
from product_db.templatetags.currency import currency
import zipfile
import tempfile
import shutil
import ntpath
import os
import re
from cms.models.pagemodel import Page
from django.conf import settings
from modifier.help_functions import url_to_path
from django.utils.translation import get_language
from urlparse import urljoin
from django.utils.safestring import mark_safe
class Price(models.Model):
    prices_path=settings.MEDIA_ROOT+'/files/generated_prices'
    head_name=models.CharField(null=True, blank=True, max_length=100,verbose_name=_("Price name"))

    name=EavSlugField(_("Document name"), max_length=50, help_text=_("Use this name like '{% load price_file %} {% price_file site='auto' lang='auto' %}'." ),
                   unique=True)
    last_update= TextField(_("Last document update"), default='Price never generated', editable=False)
    price_page=EavSlugField(_("Reverse id of price page"), max_length=100)

    #todo show normal datetime everywhere

    def generate_new_prices(self):
        
        self.last_update='Generating (start: '+ str(now()).split('.')[0] +')' 
        self.save()
        try:
            for template in self.pricetemplate_set.all():
                if template.template_file and template.template_file.hash:
                    template.generate_price(self.prices_path)
            self.last_update= str(now()).split('.')[0] 
            self.save()
        except Exception as e:
            s = str(e)
            self.last_update="ERROR: "+s 
            self.save()
    class Meta:
        verbose_name = _('price list')
        verbose_name_plural = _('Price lists')




        
class Chunk(models.Model):
    class Meta:
            verbose_name = _('Chunk for price templates')
            verbose_name_plural = _('Chunks for price templates')
    slug = EavSlugField(_("Chunk slug"), max_length=50, unique=True, help_text=_("Put this slug with ctrl-f2 in odt template as simple odt template var"))
    
    
class LangChunk(models.Model):

    LANG_CHOICES = settings.LANGUAGES  + [('default','default')]
    chunk = ForeignKey(Chunk, blank=True, null=True)
    site = CharField(max_length=15)
    language =  CharField(_("Chunk language"),max_length=15, choices=LANG_CHOICES, default='default', help_text=_("Choose language of chunk. If it is on default or universal language - choose default.") )
    styles = models.TextField(_("Styles"), blank=True, null=True, help_text=_("Add styles, if there is some used in chunk"))
    content = models.TextField(_("Chunk content"), blank=True, null=True, help_text=_("Chunk content that will replace slug in template"))
    fonts = models.TextField(_("Fonts"), blank=True, null=True, help_text=_("Add fonts, if there is some used in chunk"))
    image = ElfinderField(blank=True, null=True, help_text=_("Choose image file, if there is some used in chunk"))
    


class PriceTemplate(models.Model):

    LANG_CHOICES = settings.LANGUAGES  + [('default','default')]

    price_field= CharField(max_length=40, blank=True, null=True)
    price_field2= CharField(max_length=40, blank=True, null=True)
    price_field3= CharField(max_length=40, blank=True, null=True)
    price= ForeignKey(Price, blank=True, null=True)
    site = CharField(max_length=15)
    language =  CharField(_("Template language"),max_length=15, choices=LANG_CHOICES, default='default', help_text=_("Choose language of document. If it is on default or universal language - choose default.") )

    #todo only odt
    #todo label of set template and modular inline
    #todo normal save
    template_file = ElfinderField(blank=True, null=True, help_text=_("Choose ODT price list template."), start_path='price_templates')

    
    
    class Meta:
        verbose_name = _('price template')
        verbose_name_plural = _('Price templates')
    

    def __unicode__(self):
        return mark_safe('<b style="font-weight: normal; font-size: 13px;">'+Site.objects.get(pk=self.site).domain+', '+self.language+', '+self.price_field+', '+self.price_field2 +'</b><br><br>'+_('Result:')+' <a target="_blank" href="'+self.price_file()[0]+'">'+self.price_file()[0]+'</a>, '+str(self.price_file()[1])+'kb')
    
    def price_file(self):
        
        name=self.price.name
        site=Site.objects.get(pk=self.site).site_cutting
        lang=self.language
        
        if not site:
            site='_'+Site.objects.get_current().site_cutting
        else:
            site='_'+site
        if not lang:
           lang='_'+get_language()
        elif lang=='default':
            lang=''
        else:
            lang='_'+lang
        

        name_with_lang=name+site+lang+'.pdf'
        prices_folder=settings.MEDIA_ROOT + "/files/generated_prices/"
        prices_url=urljoin(settings.MEDIA_URL, "files/generated_prices/")
        
        time=str(Price.objects.get(name=name).last_update).translate(None, ' -:')
        if path.isfile(path.join(Price.prices_path,name_with_lang)):
            return urljoin(prices_url,name_with_lang)+'?date='+time, os.path.getsize(path.join(Price.prices_path,name_with_lang))/1024
        else:

            return "404",'0'    
            

    @staticmethod 
    def remove_from_zip(zipfname, *filenames):
        tempdir = tempfile.mkdtemp()
        try:
            tempname = os.path.join(tempdir, 'new.zip')
            with zipfile.ZipFile(zipfname, 'r') as zipread:
                with zipfile.ZipFile(tempname, 'w') as zipwrite:
                    for item in zipread.infolist():
                        if item.filename not in filenames:
                            data = zipread.read(item.filename)
                            zipwrite.writestr(item, data)
            shutil.move(tempname, zipfname)
        finally:
            shutil.rmtree(tempdir)

    @staticmethod
    def insert(original, new, pos):
        return original[:pos] + new.encode('utf-8') + original[pos:]
    
    @staticmethod
    def replace(original, new, pos_start, pos_end):
        return original[:pos_start] + new.encode('utf-8') + original[pos_end:]
    
    def replace_style_names(self, cont, postfix):
        styles = 'P','T','fr','gr'
        for style in styles:
            for i in range(30):
                cont=cont.replace(style+str(i), style+str(i)+'_'+postfix)
        return cont
        
    def add_info_to_odt(self, file_name, file_path, chunks, styles, fonts, pictures):
        path_w_file = os.path.join(file_path, file_name)
        path_to_temp = os.path.join(file_path, 'temp', file_name)
        path_to_f_in_temp = os.path.join(path_to_temp, file_name)
        with zipfile.ZipFile(path_w_file, "r") as z:
            z.extractall(path_to_temp)
        shutil.copy(path_w_file, path_to_temp)
        self.remove_from_zip(path_to_f_in_temp, 'content.xml')
        self.remove_from_zip(path_to_f_in_temp, 'META-INF/manifest.xml')
        self.remove_from_zip(path_to_f_in_temp, 'meta.xml')
        manifest_path = os.path.join(path_to_temp, 'META-INF/manifest.xml')

        if pictures:
            with open(manifest_path, 'r') as f:
                cont = f.read()
                cont = cont
                pos = cont.find('</manifest:manifest>')
                for picture in pictures:
                    file_name = ntpath.basename(picture)
                    new_str = '<manifest:file-entry manifest:full-path="Pictures/'+file_name+'" manifest:media-type=""/>'
                    cont = self.insert(cont, new_str, pos)

            with open(manifest_path, 'w') as f:
                f.write(cont)

                
        meta_path = os.path.join(path_to_temp, 'meta.xml')
        
        with open(meta_path, 'r') as f:
            cont = f.read()
            pos = cont.find('<dc:title>')
            if pos != -1:
                pos = pos+10
                if self.language != 'default':
                    head_name=getattr(self.price, 'head_name_' +self.language)
                    if head_name==None:
                        head_name=''
                    cont = self.insert(cont, unicode(getattr(Site.objects.get(pk=self.site),'company_'+self.language))+' '+head_name + ' ' + _('prices'), pos)
                else:
                    cont = self.insert(cont, getattr(Site.objects.get(pk=self.site), company), pos)  
            else:
                
                pos = cont.find('<office:meta>')
                pos = pos+13
                if self.language != 'default':
                    head_name=getattr(self.price, 'head_name_' +self.language)
                    if head_name==None:
                        head_name=''
                    cont = self.insert(cont,'<dc:title>'+ unicode(getattr(Site.objects.get(pk=self.site),'company_'+self.language))+' '+head_name + ' ' + _('prices')+ '</dc:title>', pos)
                else:
                    cont = self.insert(cont, getattr(Site.objects.get(pk=self.site), company), pos) 
        with open(meta_path, 'w') as f:
            f.write(cont)
                
                
        content_path = os.path.join(path_to_temp, 'content.xml')

        with open(content_path, 'r') as f:
            
            cont = f.read()
            
#            for chunk in chunks.iteritems():
#                if chunk[0][-3:] == u'_np':
#                    repl_text = u'"%s" text:string-value-if-false="">%s' % (chunk[0], chunk[0])
#                    repl_text = repl_text.encode('utf-8')
#                    repl_len = len(repl_text)
#                    pos = cont.find(repl_text)-76
#                    #raise Exception(str(pos)+'  '+ repl_text+ '    '+ cont)
#                    if pos!=-1:
#                        cont = self.replace(cont, chunk[1], pos, pos+len(repl_text)+24+76)
#                    #raise Exception(cont)
            
            if styles:
                pos = cont.find('<office:automatic-styles>') + len('<office:automatic-styles>')
                cont = self.insert(cont, styles, pos)

            if fonts:
                pos = cont.find('<office:font-face-decls>') + len('<office:font-face-decls>')
                
                cont = self.insert(cont, fonts, pos)
            
            for chunk in chunks.iteritems():
                if chunk[0][-3:] != u'_np':
                    repl_text = u'<text:conditional-text text:condition="ooow:true" text:string-value-if-true="%s" text:string-value-if-false="">%s</text:conditional-text>' % (chunk[0], chunk[0])
                    repl_text = repl_text.encode('utf-8')
                    repl_len = len(repl_text)
                    pos = cont.find(repl_text)
                    if pos!=-1:
                        pos_start = pos - cont[:pos-1][::-1].find('<text:p '[::-1])-9
                        pos_end = cont.find('</text:p>', pos, -1)+1+8
                        cont = self.replace(cont, chunk[1], pos_start, pos_end)

        with open(content_path, 'w') as f:
            f.write(cont)


        with zipfile.ZipFile(path_to_f_in_temp, 'a') as myzip:
            myzip.write(content_path, 'content.xml')
            myzip.write(manifest_path, 'META-INF/manifest.xml')
            myzip.write(meta_path, 'meta.xml')
            for picture in pictures:
                myzip.write(picture, os.path.join('Pictures',  ntpath.basename(picture)))

        return path_to_f_in_temp, path_to_temp
    
    def generate_price(self, folder):
        res_path=path.join(folder, self.get_price_name())
        context=self.get_template_context()
        if platform.system() == 'Linux':
            template=settings.PROJECT_PATH+self.template_file.url
            file_name=ntpath.basename(template)
            file_path=os.path.dirname(os.path.abspath(template))
            styles = ''
            fonts = ''
            images = []
            chunks_dict = {}
            for whole_chunk in Chunk.objects.all():
                res_chanks=whole_chunk.langchunk_set.filter(language=self.language, site=self.site)
                if len(res_chanks) == 0:
                    res_chanks=whole_chunk.langchunk_set.filter(language='default', site=self.site)
                if len(res_chanks) !=0:
                    chunk = res_chanks[0]
                    styles += self.replace_style_names(chunk.styles, whole_chunk.slug)
                    fonts += chunk.fonts
                    if chunk.image:
                        images.append(url_to_path(chunk.image.url))
                    chunk_with_no_blank = chunk.content.replace('    ','').replace('\n','').replace('\r','')
                    chunks_dict[whole_chunk.slug] = self.replace_style_names(chunk_with_no_blank, whole_chunk.slug)
            res_templ, path_to_temp =  self.add_info_to_odt(file_name, file_path, chunks_dict, styles, fonts, images)
            renderer = Renderer(res_templ, context, res_path,  overwriteExisting=True, pythonWithUnoPath="/usr/bin/python3")
            
            renderer.run()
            shutil.rmtree(path_to_temp, ignore_errors=False)
            pages=Page.objects.filter(reverse_id=self.price.price_page, published=True)
            for page in pages:
                page.last_publish_date=datetime.now()
                page._publisher_keep_state = True
                page.save()

  #      else:
  #          template=path.join(settings.PROJECT_PATH,self.template_file.url.replace('/','\\')[1:])
#
  #          renderer = Renderer(template, context, res_path,  overwriteExisting=True, pythonWithUnoPath='C:\\progra~2\\libreo~1.6\\program\\python.exe')
  #          renderer.run()
        #print "renderer  runned", template, res_path

    def get_template_context(self):
        all_products=Product.objects.filter(active=True)
        template_context={}

        template_context['cur'] = currency(price_slug=self.price_field, lang=self.language)
        template_context['cur_up'] = currency(price_slug=self.price_field, upper=True, lang=self.language)
        if self.price_field2 != 'none':
            template_context['cur2']=currency(price_slug=self.price_field2, lang=self.language)
            template_context['cur2_up'] = currency(price_slug=self.price_field2, upper=True, lang=self.language)
        
        if self.price_field3 != 'none':
                    template_context['cur3']=currency(price_slug=self.price_field3, lang=self.language)
                    template_context['cur3_up'] = currency(price_slug=self.price_field3, upper=True, lang=self.language)        
        for product in all_products:
            price_string=product.price(price_slug=self.price_field,lang=self.language)
            template_context[product.slug+'__price']=self.format_price_str(price_string)
            if self.price_field2 != 'none':
                price_string2=product.price(price_slug=self.price_field2, lang=self.language)
                template_context[product.slug+'__price2']=self.format_price_str(price_string2)
            if self.price_field3 != 'none':
                price_string3=product.price(price_slug=self.price_field3, lang=self.language)
                template_context[product.slug+'__price3']=self.format_price_str(price_string3)
            template_context[product.slug+'__name_ru']=self.pname_foramtter(product.name_ru)
            template_context[product.slug+'__name_en']=self.pname_foramtter(product.name_en)
            if self.language!='default':
                template_context[product.slug+'__name']=self.pname_foramtter(getattr(product,'name'+'_'+self.language))
            else:
                template_context[product.slug+'__name']=self.pname_foramtter(getattr(product,'name'))
            for field in product.get_secondary_attributes():
                if field.datatype==Attribute.TYPE_TEXT or field.datatype==Attribute.TYPE_FLOAT or field.datatype==Attribute.TYPE_DATE:
                    template_context[product.slug+'__'+field.slug]=getattr(product,field.slug)

        return template_context

        
    def format_price_str(self,price_str):
    
    
        try:
            price_str="%0.2f" % round(float(price_str),2)
            price_str=self.thous(price_str)
            price_str=price_str.replace('.',',')
            return price_str
            
        except: #i dont now why it puts elfinder so no exc
            return price_str

    def pname_foramtter(self, name):
        name.replace('-', ' - ',1)
        return name.replace('-', ' - ',1)
    
    def thous(sel, x, sep=' ', dot='.'):
        num, _, frac = str(x).partition(dot)
        num = re.sub(r'(\d{3})(?=\d)', r'\1'+sep, num[::-1])[::-1]
        if frac:
            num += dot + frac
        return num
        
    def get_price_name(self):


        site='_'+Site.objects.get(pk=self.site).site_cutting

        if self.language=='default':
            language=''
        else:
            language='_'+self.language

        return self.price.name+site+language+'.pdf'
