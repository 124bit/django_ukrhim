# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'ImageSpecModel'
        db.create_table(u'modifier_imagespecmodel', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('eav.fields.EavSlugField')(max_length=30)),
            ('specs', self.gf('jsonfield.fields.JSONField')(default='{}', blank=True)),
        ))
        db.send_create_signal(u'modifier', ['ImageSpecModel'])

        # Adding model 'ElfinderFileHolder'
        db.create_table(u'cmsplugin_elfinderfileholder', (
            (u'cmsplugin_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['cms.CMSPlugin'], unique=True, primary_key=True)),
            ('file_field', self.gf('elfinder.fields.ElfinderField')(max_length=100)),
        ))
        db.send_create_signal(u'modifier', ['ElfinderFileHolder'])

        # Adding model 'ElfinderPictureHolder'
        db.create_table(u'cmsplugin_elfinderpictureholder', (
            (u'cmsplugin_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['cms.CMSPlugin'], unique=True, primary_key=True)),
            ('file_field', self.gf('elfinder.fields.ElfinderField')(max_length=100)),
            ('logic', self.gf('django.db.models.fields.CharField')(max_length=10)),
            ('html_tags', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('generator', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['modifier.ImageSpecModel'], null=True, blank=True)),
            ('var_name', self.gf('django.db.models.fields.CharField')(max_length=20, blank=True)),
        ))
        db.send_create_signal(u'modifier', ['ElfinderPictureHolder'])


    def backwards(self, orm):
        # Deleting model 'ImageSpecModel'
        db.delete_table(u'modifier_imagespecmodel')

        # Deleting model 'ElfinderFileHolder'
        db.delete_table(u'cmsplugin_elfinderfileholder')

        # Deleting model 'ElfinderPictureHolder'
        db.delete_table(u'cmsplugin_elfinderpictureholder')


    models = {
        'cms.cmsplugin': {
            'Meta': {'object_name': 'CMSPlugin'},
            'changed_date': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'creation_date': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'language': ('django.db.models.fields.CharField', [], {'max_length': '15', 'db_index': 'True'}),
            'level': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'}),
            'lft': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'}),
            'parent': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['cms.CMSPlugin']", 'null': 'True', 'blank': 'True'}),
            'placeholder': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['cms.Placeholder']", 'null': 'True'}),
            'plugin_type': ('django.db.models.fields.CharField', [], {'max_length': '50', 'db_index': 'True'}),
            'position': ('django.db.models.fields.PositiveSmallIntegerField', [], {'null': 'True', 'blank': 'True'}),
            'rght': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'}),
            'tree_id': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'})
        },
        'cms.placeholder': {
            'Meta': {'object_name': 'Placeholder'},
            'default_width': ('django.db.models.fields.PositiveSmallIntegerField', [], {'null': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'slot': ('django.db.models.fields.CharField', [], {'max_length': '50', 'db_index': 'True'})
        },
        u'modifier.elfinderfileholder': {
            'Meta': {'object_name': 'ElfinderFileHolder', 'db_table': "u'cmsplugin_elfinderfileholder'", '_ormbases': ['cms.CMSPlugin']},
            u'cmsplugin_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['cms.CMSPlugin']", 'unique': 'True', 'primary_key': 'True'}),
            'file_field': ('elfinder.fields.ElfinderField', [], {'max_length': '100'})
        },
        u'modifier.elfinderpictureholder': {
            'Meta': {'object_name': 'ElfinderPictureHolder', 'db_table': "u'cmsplugin_elfinderpictureholder'", '_ormbases': ['cms.CMSPlugin']},
            u'cmsplugin_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['cms.CMSPlugin']", 'unique': 'True', 'primary_key': 'True'}),
            'file_field': ('elfinder.fields.ElfinderField', [], {'max_length': '100'}),
            'generator': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['modifier.ImageSpecModel']", 'null': 'True', 'blank': 'True'}),
            'html_tags': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'logic': ('django.db.models.fields.CharField', [], {'max_length': '10'}),
            'var_name': ('django.db.models.fields.CharField', [], {'max_length': '20', 'blank': 'True'})
        },
        u'modifier.imagespecmodel': {
            'Meta': {'object_name': 'ImageSpecModel'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('eav.fields.EavSlugField', [], {'max_length': '30'}),
            'specs': ('jsonfield.fields.JSONField', [], {'default': "'{}'", 'blank': 'True'})
        }
    }

    complete_apps = ['modifier']