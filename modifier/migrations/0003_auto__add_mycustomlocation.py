# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'MyCustomLocation'
        db.create_table(u'modifier_mycustomlocation', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('city', self.gf('django.db.models.fields.related.OneToOneField')(related_name='my_custom_location', unique=True, to=orm['django_geoip.City'])),
            ('is_default', self.gf('django.db.models.fields.BooleanField')(default=False)),
        ))
        db.send_create_signal(u'modifier', ['MyCustomLocation'])


    def backwards(self, orm):
        # Deleting model 'MyCustomLocation'
        db.delete_table(u'modifier_mycustomlocation')


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
        u'django_geoip.city': {
            'Meta': {'unique_together': "(('region', 'name'),)", 'object_name': 'City'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'latitude': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '9', 'decimal_places': '6', 'blank': 'True'}),
            'longitude': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '9', 'decimal_places': '6', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'region': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'cities'", 'to': u"orm['django_geoip.Region']"})
        },
        u'django_geoip.country': {
            'Meta': {'object_name': 'Country'},
            'code': ('django.db.models.fields.CharField', [], {'max_length': '2', 'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '255'})
        },
        u'django_geoip.region': {
            'Meta': {'unique_together': "(('country', 'name'),)", 'object_name': 'Region'},
            'country': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'regions'", 'to': u"orm['django_geoip.Country']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        },
        u'modifier.elfinderfileholder': {
            'Meta': {'object_name': 'ElfinderFileHolder', 'db_table': "u'cmsplugin_elfinderfileholder'", '_ormbases': ['cms.CMSPlugin']},
            u'cmsplugin_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['cms.CMSPlugin']", 'unique': 'True', 'primary_key': 'True'}),
            'file_field': ('elfinder.fields.ElfinderField', [], {'max_length': '600'})
        },
        u'modifier.elfinderpictureholder': {
            'Meta': {'object_name': 'ElfinderPictureHolder', 'db_table': "u'cmsplugin_elfinderpictureholder'", '_ormbases': ['cms.CMSPlugin']},
            u'cmsplugin_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['cms.CMSPlugin']", 'unique': 'True', 'primary_key': 'True'}),
            'file_field': ('elfinder.fields.ElfinderField', [], {'max_length': '600'}),
            'generator': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['modifier.ImageSpecModel']", 'null': 'True', 'blank': 'True'}),
            'html_tags': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'logic': ('django.db.models.fields.CharField', [], {'max_length': '10'}),
            'var_name': ('django.db.models.fields.CharField', [], {'max_length': '20', 'blank': 'True'})
        },
        u'modifier.fileloader': {
            'Meta': {'object_name': 'FileLoader'},
            'file': ('elfinder.fields.ElfinderField', [], {'max_length': '600', 'null': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        },
        u'modifier.imagespecmodel': {
            'Meta': {'ordering': "['name']", 'object_name': 'ImageSpecModel'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('eav.fields.EavSlugField', [], {'max_length': '30'}),
            'specs': ('jsonfield.fields.JSONField', [], {'default': "'{}'", 'blank': 'True'})
        },
        u'modifier.mycustomlocation': {
            'Meta': {'object_name': 'MyCustomLocation'},
            'city': ('django.db.models.fields.related.OneToOneField', [], {'related_name': "'my_custom_location'", 'unique': 'True', 'to': u"orm['django_geoip.City']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_default': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        }
    }

    complete_apps = ['modifier']