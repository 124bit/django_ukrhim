# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Album'
        db.create_table(u'ukrhim_gallery_album', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name_en', self.gf('django.db.models.fields.CharField')(max_length=70, null=True, blank=True)),
            ('name_ru', self.gf('django.db.models.fields.CharField')(max_length=70, null=True, blank=True)),
            ('slug', self.gf('eav.fields.EavSlugField')(unique=True, max_length=30)),
            ('show', self.gf('django.db.models.fields.BooleanField')(default=True)),
            ('face_photo', self.gf('elfinder.fields.ElfinderField')(max_length=100)),
        ))
        db.send_create_signal(u'ukrhim_gallery', ['Album'])

        # Adding model 'Media'
        db.create_table(u'ukrhim_gallery_media', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('inline_ordering_position', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('slug', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('descr_en', self.gf('django.db.models.fields.CharField')(max_length=70, null=True, blank=True)),
            ('descr_ru', self.gf('django.db.models.fields.CharField')(max_length=70, null=True, blank=True)),
            ('show', self.gf('django.db.models.fields.BooleanField')(default=True)),
            ('album', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['ukrhim_gallery.Album'])),
        ))
        db.send_create_signal(u'ukrhim_gallery', ['Media'])


    def backwards(self, orm):
        # Deleting model 'Album'
        db.delete_table(u'ukrhim_gallery_album')

        # Deleting model 'Media'
        db.delete_table(u'ukrhim_gallery_media')


    models = {
        u'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        u'generic_positions.objectposition': {
            'Meta': {'object_name': 'ObjectPosition'},
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['contenttypes.ContentType']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'object_id': ('django.db.models.fields.PositiveIntegerField', [], {}),
            'position': ('django.db.models.fields.PositiveIntegerField', [], {'null': 'True', 'blank': 'True'})
        },
        u'ukrhim_gallery.album': {
            'Meta': {'ordering': "['generic_position__position']", 'object_name': 'Album'},
            'face_photo': ('elfinder.fields.ElfinderField', [], {'max_length': '100'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name_en': ('django.db.models.fields.CharField', [], {'max_length': '70', 'null': 'True', 'blank': 'True'}),
            'name_ru': ('django.db.models.fields.CharField', [], {'max_length': '70', 'null': 'True', 'blank': 'True'}),
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