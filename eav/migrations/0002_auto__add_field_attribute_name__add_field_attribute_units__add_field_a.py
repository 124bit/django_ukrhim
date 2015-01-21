# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Removing unique constraint on 'Attribute', fields ['name_en']
        db.delete_unique(u'eav_attribute', ['name_en'])

        # Removing unique constraint on 'Attribute', fields ['name_ru']
        db.delete_unique(u'eav_attribute', ['name_ru'])

        # Adding field 'Attribute.name'
        db.add_column(u'eav_attribute', 'name',
                      self.gf('django.db.models.fields.CharField')(default='prod', max_length=100),
                      keep_default=False)

        # Adding field 'Attribute.units'
        db.add_column(u'eav_attribute', 'units',
                      self.gf('django.db.models.fields.CharField')(max_length=40, null=True, blank=True),
                      keep_default=False)

        # Adding field 'Attribute.units_en'
        db.add_column(u'eav_attribute', 'units_en',
                      self.gf('django.db.models.fields.CharField')(max_length=40, null=True, blank=True),
                      keep_default=False)

        # Adding field 'Attribute.units_ru'
        db.add_column(u'eav_attribute', 'units_ru',
                      self.gf('django.db.models.fields.CharField')(max_length=40, null=True, blank=True),
                      keep_default=False)


        # Changing field 'Attribute.name_ru'
        db.alter_column(u'eav_attribute', 'name_ru', self.gf('django.db.models.fields.CharField')(max_length=100, null=True))

        # Changing field 'Attribute.name_en'
        db.alter_column(u'eav_attribute', 'name_en', self.gf('django.db.models.fields.CharField')(max_length=100, null=True))

    def backwards(self, orm):
        # Deleting field 'Attribute.name'
        db.delete_column(u'eav_attribute', 'name')

        # Deleting field 'Attribute.units'
        db.delete_column(u'eav_attribute', 'units')

        # Deleting field 'Attribute.units_en'
        db.delete_column(u'eav_attribute', 'units_en')

        # Deleting field 'Attribute.units_ru'
        db.delete_column(u'eav_attribute', 'units_ru')


        # Changing field 'Attribute.name_ru'
        db.alter_column(u'eav_attribute', 'name_ru', self.gf('django.db.models.fields.CharField')(default='prod', max_length=100, unique=True))
        # Adding unique constraint on 'Attribute', fields ['name_ru']
        db.create_unique(u'eav_attribute', ['name_ru'])


        # Changing field 'Attribute.name_en'
        db.alter_column(u'eav_attribute', 'name_en', self.gf('django.db.models.fields.CharField')(default='prod', max_length=100, unique=True))
        # Adding unique constraint on 'Attribute', fields ['name_en']
        db.create_unique(u'eav_attribute', ['name_en'])


    models = {
        u'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        u'eav.attribute': {
            'Meta': {'object_name': 'Attribute'},
            'created': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'datatype': ('eav.fields.EavDatatypeField', [], {'max_length': '15'}),
            'description_en': ('django.db.models.fields.CharField', [], {'max_length': '256', 'null': 'True', 'blank': 'True'}),
            'description_ru': ('django.db.models.fields.CharField', [], {'max_length': '256', 'null': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'importance': ('django.db.models.fields.IntegerField', [], {'default': '0', 'null': 'True', 'blank': 'True'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name_en': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'name_ru': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'options': ('jsonfield.fields.JSONField', [], {'default': "'{}'", 'blank': 'True'}),
            'slug': ('eav.fields.EavSlugField', [], {'unique': 'True', 'max_length': '50'}),
            'units': ('django.db.models.fields.CharField', [], {'max_length': '40', 'null': 'True', 'blank': 'True'}),
            'units_en': ('django.db.models.fields.CharField', [], {'max_length': '40', 'null': 'True', 'blank': 'True'}),
            'units_ru': ('django.db.models.fields.CharField', [], {'max_length': '40', 'null': 'True', 'blank': 'True'})
        },
        u'eav.value': {
            'Meta': {'object_name': 'Value'},
            'attribute': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['eav.Attribute']"}),
            'created': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'entity_ct': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'value_entities'", 'to': u"orm['contenttypes.ContentType']"}),
            'entity_id': ('django.db.models.fields.IntegerField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'value_bool': ('django.db.models.fields.NullBooleanField', [], {'null': 'True', 'blank': 'True'}),
            'value_date': ('django.db.models.fields.DateTimeField', [], {'null': 'True', 'blank': 'True'}),
            'value_enum': ('django.db.models.fields.CharField', [], {'max_length': '30', 'null': 'True', 'blank': 'True'}),
            'value_file': ('elfinder.fields.ElfinderField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'value_float': ('django.db.models.fields.FloatField', [], {'null': 'True', 'blank': 'True'}),
            'value_image': ('elfinder.fields.ElfinderField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'value_int': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'value_list': ('eav.fields.MultiSelectField', [], {'null': 'True', 'blank': 'True'}),
            'value_text': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'})
        }
    }

    complete_apps = ['eav']