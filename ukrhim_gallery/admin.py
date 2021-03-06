from django.contrib import admin
from models import Media, Album, Video
from inline_ordering.admin import OrderableStackedInline
from os import path
from modifier.help_functions import url_to_path
from django import forms
from os import listdir
from django.utils.translation import ugettext as _
from django.utils.translation import get_language
from django.db import models
from django.forms import ModelForm, Textarea
class MediaInline(OrderableStackedInline):
    model = Media
    extra = 2
    formfield_overrides = {
        models.TextField: {'widget': Textarea(attrs={'cols': 150, 'rows': 2})}
    }
    #def get_readonly_fields(self, request, obj=None):
    #    '''
    #    Override to make certain fields readonly if this is a change request
    #    '''
    #    if obj:
    #         return self.readonly_fields + ('slug',)
    #     return self.readonly_fields
class VideoInline(OrderableStackedInline):
    model = Video
    extra = 0

# def delete_old_photos(modeladmin, request, queryset):
    # for inst in queryset.all():
        # folder_url='/'.join(inst.face_photo.url.split('/')[:-1])
        # folder_path=url_to_path(folder_url)
        # all_files=listdir(folder_path)
        # photos_urls = [ folder_url+'/'+file_name for file_name in all_files if '_face' not in file_name ]
        # for photo in inst.media_set.all():
            # if photo.slug not in photos_urls and photo.slug[:4]!='http':
                # photo.delete()
# delete_old_photos.short_description = _("Delete deleted photos")

class AlbumAdmin(admin.ModelAdmin):
    save_on_top=True
    model = Album
    inlines = [MediaInline, VideoInline]
    #actions = [delete_old_photos]
    list_display = ( 'slug', 'show')
    list_editable = ('show',)
    prepopulated_fields = {'slug':("name_en",)}
    def get_list_display(self, request):

            if get_language()=='ru':
                return ('name_ru', 'slug', 'show')
            else:
                return ('name_en', 'slug', 'show')



admin.site.register(Album, AlbumAdmin)