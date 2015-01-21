# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Video'
        db.create_table(u'ukrhim_gallery_video', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('inline_ordering_position', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('slug', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('descr_en', self.gf('django.db.models.fields.TextField')(null=True, blank=True)),
            ('descr_ru', self.gf('django.db.models.fields.TextField')(null=True, blank=True)),
            ('show', self.gf('django.db.models.fields.BooleanField')(default=True)),
            ('album', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['ukrhim_gallery.Album'])),
        ))
        db.send_create_signal(u'ukrhim_gallery', ['Video'])


        # Changing field 'Media.descr_ru'
        db.alter_column(u'ukrhim_gallery_media', 'descr_ru', self.gf('django.db.models.fields.TextField')(null=True))

        # Changing field 'Media.descr_en'
        db.alter_column(u'ukrhim_gallery_media', 'descr_en', self.gf('django.db.models.fields.TextField')(null=True))

        # Changing field 'Media.slug'
        db.alter_column(u'ukrhim_gallery_media', 'slug', self.gf('elfinder.fields.ElfinderField')(max_length=600, null=True))

    def backwards(self, orm):
        # Deleting model 'Video'
        db.delete_table(u'ukrhim_gallery_video')


        # Changing field 'Media.descr_ru'
        db.alter_column(u'ukrhim_gallery_media', 'descr_ru', self.gf('django.db.models.fields.CharField')(max_length=240, null=True))

        # Changing field 'Media.descr_en'
        db.alter_column(u'ukrhim_gallery_media', 'descr_en', self.gf('django.db.models.fields.CharField')(max_length=240, null=True))

        # User chose to not deal with backwards NULL issues for 'Media.slug'
        raise RuntimeError("Cannot reverse this migration. 'Media.slug' and its values cannot be restored.")
        
        # The following code is provided here to aid in writing a correct migration
        # Changing field 'Media.slug'
        db.alter_column(u'ukrhim_gallery_media', 'slug', self.gf('django.db.models.fields.CharField')(max_length=255))

    models = {
        u'ukrhim_gallery.album': {
            'Meta': {'ordering': "['position']", 'object_name': 'Album'},
            'face_photo': ('elfinder.fields.ElfinderField', [], {'max_length': '600'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name_en': ('django.db.models.fields.CharField', [], {'max_length': '70', 'null': 'True', 'blank': 'True'}),
            'name_ru': ('django.db.models.fields.CharField', [], {'max_length': '70', 'null': 'True', 'blank': 'True'}),
            'position': ('django.db.models.fields.IntegerField', [], {}),
            'show': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'slug': ('eav.fields.EavSlugField', [], {'unique': 'True', 'max_length': '30'})
        },
        u'ukrhim_gallery.media': {
            'Meta': {'object_name': 'Media'},
            'album': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['ukrhim_gallery.Album']"}),
            'descr_en': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'descr_ru': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'inline_ordering_position': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'show': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'slug': ('elfinder.fields.ElfinderField', [], {'max_length': '600', 'null': 'True', 'blank': 'True'})
        },
        u'ukrhim_gallery.video': {
            'Meta': {'object_name': 'Video'},
            'album': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['ukrhim_gallery.Album']"}),
            'descr_en': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'descr_ru': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'inline_ordering_position': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'show': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'slug': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        }
    }

    complete_apps = ['ukrhim_gallery']