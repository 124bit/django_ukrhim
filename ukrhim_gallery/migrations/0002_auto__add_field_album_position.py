# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding field 'Album.position'
        db.add_column(u'ukrhim_gallery_album', 'position',
                      self.gf('django.db.models.fields.IntegerField')(default=-1),
                      keep_default=False)


    def backwards(self, orm):
        # Deleting field 'Album.position'
        db.delete_column(u'ukrhim_gallery_album', 'position')


    models = {
        u'ukrhim_gallery.album': {
            'Meta': {'ordering': "['generic_position__position']", 'object_name': 'Album'},
            'face_photo': ('elfinder.fields.ElfinderField', [], {'max_length': '100'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name_en': ('django.db.models.fields.CharField', [], {'max_length': '70', 'null': 'True', 'blank': 'True'}),
            'name_ru': ('django.db.models.fields.CharField', [], {'max_length': '70', 'null': 'True', 'blank': 'True'}),
            'position': ('django.db.models.fields.IntegerField', [], {'default': '-1'}),
            'show': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'slug': ('eav.fields.EavSlugField', [], {'unique': 'True', 'max_length': '30'})
        },
        u'ukrhim_gallery.media': {
            'Meta': {'ordering': "('inline_ordering_position',)", 'object_name': 'Media'},
            'album': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['ukrhim_gallery.Album']"}),
            'descr_en': ('django.db.models.fields.CharField', [], {'max_length': '70', 'null': 'True', 'blank': 'True'}),
            'descr_ru': ('django.db.models.fields.CharField', [], {'max_length': '70', 'null': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'inline_ordering_position': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'show': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'slug': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        }
    }

    complete_apps = ['ukrhim_gallery']