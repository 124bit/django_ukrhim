# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Attribute'
        db.create_table(u'eav_attribute', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name_ru', self.gf('django.db.models.fields.CharField')(unique=True, max_length=100)),
            ('name_en', self.gf('django.db.models.fields.CharField')(unique=True, max_length=100)),
            ('slug', self.gf('eav.fields.EavSlugField')(unique=True, max_length=50)),
            ('datatype', self.gf('eav.fields.EavDatatypeField')(max_length=15)),
            ('description_ru', self.gf('django.db.models.fields.CharField')(max_length=256, null=True, blank=True)),
            ('description_en', self.gf('django.db.models.fields.CharField')(max_length=256, null=True, blank=True)),
            ('importance', self.gf('django.db.models.fields.IntegerField')(default=0, null=True, blank=True)),
            ('created', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now)),
            ('modified', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('options', self.gf('jsonfield.fields.JSONField')(default='{}', blank=True)),
        ))
        db.send_create_signal(u'eav', ['Attribute'])

        # Adding model 'Value'
        db.create_table(u'eav_value', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('entity_ct', self.gf('django.db.models.fields.related.ForeignKey')(related_name='value_entities', to=orm['contenttypes.ContentType'])),
            ('entity_id', self.gf('django.db.models.fields.IntegerField')()),
            ('value_text', self.gf('django.db.models.fields.TextField')(null=True, blank=True)),
            ('value_float', self.gf('django.db.models.fields.FloatField')(null=True, blank=True)),
            ('value_int', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('value_date', self.gf('django.db.models.fields.DateTimeField')(null=True, blank=True)),
            ('value_bool', self.gf('django.db.models.fields.NullBooleanField')(null=True, blank=True)),
            ('value_enum', self.gf('django.db.models.fields.CharField')(max_length=30, null=True, blank=True)),
            ('value_file', self.gf('elfinder.fields.ElfinderField')(max_length=100, null=True, blank=True)),
            ('value_image', self.gf('elfinder.fields.ElfinderField')(max_length=100, null=True, blank=True)),
            ('value_list', self.gf('eav.fields.MultiSelectField')(null=True, blank=True)),
            ('created', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now)),
            ('modified', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('attribute', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['eav.Attribute'])),
        ))
        db.send_create_signal(u'eav', ['Value'])


    def backwards(self, orm):
        # Deleting model 'Attribute'
        db.delete_table(u'eav_attribute')

        # Deleting model 'Value'
        db.delete_table(u'eav_value')


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
            'name_en': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '100'}),
            'name_ru': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '100'}),
            'options': ('jsonfield.fields.JSONField', [], {'default': "'{}'", 'blank': 'True'}),
            'slug': ('eav.fields.EavSlugField', [], {'unique': 'True', 'max_length': '50'})
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