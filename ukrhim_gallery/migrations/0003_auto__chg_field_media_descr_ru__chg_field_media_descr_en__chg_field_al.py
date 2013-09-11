# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):

        # Changing field 'Media.descr_ru'
        db.alter_column(u'ukrhim_gallery_media', 'descr_ru', self.gf('django.db.models.fields.CharField')(max_length=240, null=True))

        # Changing field 'Media.descr_en'
        db.alter_column(u'ukrhim_gallery_media', 'descr_en', self.gf('django.db.models.fields.CharField')(max_length=240, null=True))

        # Changing field 'Album.face_photo'
        db.alter_column(u'ukrhim_gallery_album', 'face_photo', self.gf('elfinder.fields.ElfinderField')(max_length=600))

    def backwards(self, orm):

        # Changing field 'Media.descr_ru'
        db.alter_column(u'ukrhim_gallery_media', 'descr_ru', self.gf('django.db.models.fields.CharField')(max_length=70, null=True))

        # Changing field 'Media.descr_en'
        db.alter_column(u'ukrhim_gallery_media', 'descr_en', self.gf('django.db.models.fields.CharField')(max_length=70, null=True))

        # Changing field 'Album.face_photo'
        db.alter_column(u'ukrhim_gallery_album', 'face_photo', self.gf('elfinder.fields.ElfinderField')(max_length=100))

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
            'Meta': {'ordering': "('inline_ordering_position',)", 'object_name': 'Media'},
            'album': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['ukrhim_gallery.Album']"}),
            'descr_en': ('django.db.models.fields.CharField', [], {'max_length': '240', 'null': 'True', 'blank': 'True'}),
            'descr_ru': ('django.db.models.fields.CharField', [], {'max_length': '240', 'null': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'inline_ordering_position': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'show': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'slug': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        }
    }

    complete_apps = ['ukrhim_gallery']