__author__ = 'Agafon'
from django.db import models
from django.utils.translation import ugettext as _
from eav.fields import EavSlugField
from elfinder.fields import ElfinderField
from inline_ordering.models import Orderable
from os import path, listdir
from django.conf import settings
from urlparse import urljoin
from modifier.help_functions import url_to_path
from django.utils.translation import get_language
from django.contrib.contenttypes import generic
from positions import PositionField
class Album(models.Model):
    name_en=models.CharField(max_length=70,verbose_name=_("Album name (en)"),null=True,blank=True)
    name_ru=models.CharField(max_length=70,verbose_name=_("Album name (ru)"),null=True,blank=True)
    slug=EavSlugField(max_length=30,verbose_name=_("album slug"),help_text=_("Short unique label."), unique=True)
    show=models.BooleanField(verbose_name=_("Show album"),default=True)
    face_photo=ElfinderField(help_text=_("Choose photo"))
    position = PositionField(verbose_name=_('Position in list'))
    class Meta:
        ordering = ['position']
        verbose_name = _('Album')
        verbose_name_plural = _('Albums')

    def save(self,*args,**kwargs):
        super(Album,self).save(*args,**kwargs)
        folder_url='/'.join(self.face_photo.url.split('/')[:-1])
        folder_path=url_to_path(folder_url)
        all_files=listdir(folder_path)
        photos_urls = [ folder_url+'/'+file_name for file_name in all_files if '_face' not in file_name ]


        for photo in photos_urls:
            if not self.media_set.filter(slug=photo).exists():
                a=Media(slug=photo,album=self)
                a.save()


    def __unicode__(self):
        current_lang=get_language()
        if current_lang=='ru':
            return self.name_ru
        else:
            return  self.name_en

    def name(self):
        current_lang=get_language()
        if current_lang=='ru':
            return self.name_ru
        else:
            return  self.name_en


class Media(Orderable):
    slug=models.CharField(max_length=255,verbose_name=_("name/url"))
    descr_en=models.CharField(max_length=250,verbose_name=_("Photo description (en)"),null=True,blank=True)
    descr_ru=models.CharField(max_length=250,verbose_name=_("Photo description (ru)"),null=True,blank=True)
    show=models.BooleanField(verbose_name=_("Show photo"),default=True)
    album=models.ForeignKey(Album)
    def __unicode__(self):
        return self.slug

    def descr(self):
        current_lang=get_language()
        if current_lang=='ru':
            return self.descr_ru
        else:
            return  self.descr_en
