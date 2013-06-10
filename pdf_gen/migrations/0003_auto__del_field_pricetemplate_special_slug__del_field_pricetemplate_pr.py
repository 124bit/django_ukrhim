# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Deleting field 'PriceTemplate.special_slug'
        db.delete_column('pdf_gen_pricetemplate', 'special_slug')

        # Deleting field 'PriceTemplate.price'
        db.delete_column('pdf_gen_pricetemplate', 'price_id')

        # Adding field 'PriceTemplate.price_field'
        db.add_column('pdf_gen_pricetemplate', 'price_field',
                      self.gf('django.db.models.fields.related.ForeignKey')(to=orm['eav.Attribute'], null=True, blank=True),
                      keep_default=False)


    def backwards(self, orm):
        # Adding field 'PriceTemplate.special_slug'
        db.add_column('pdf_gen_pricetemplate', 'special_slug',
                      self.gf('django.db.models.fields.CharField')(default='', max_length=50, blank=True),
                      keep_default=False)


        # User chose to not deal with backwards NULL issues for 'PriceTemplate.price'
        raise RuntimeError("Cannot reverse this migration. 'PriceTemplate.price' and its values cannot be restored.")
        # Deleting field 'PriceTemplate.price_field'
        db.delete_column('pdf_gen_pricetemplate', 'price_field_id')


    models = {
        'eav.attribute': {
            'Meta': {'object_name': 'Attribute'},
            'created': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'datatype': ('django.db.models.fields.CharField', [], {'max_length': '15'}),
            'description_en': ('django.db.models.fields.CharField', [], {'max_length': '256', 'null': 'True', 'blank': 'True'}),
            'description_ru': ('django.db.models.fields.CharField', [], {'max_length': '256', 'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'importance': ('django.db.models.fields.IntegerField', [], {'default': '0', 'null': 'True', 'blank': 'True'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'name_en': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '100'}),
            'name_ru': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '100'}),
            'options': ('jsonfield.fields.JSONField', [], {'default': "'{}'", 'blank': 'True'}),
            'slug': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '50', 'db_index': 'True'})
        },
        'pdf_gen.price': {
            'Meta': {'object_name': 'Price'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'last_update': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(1980, 2, 2, 0, 0)'}),
            'name': ('django.db.models.fields.SlugField', [], {'unique': 'True', 'max_length': '50'})
        },
        'pdf_gen.pricetemplate': {
            'Meta': {'object_name': 'PriceTemplate'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'language': ('django.db.models.fields.CharField', [], {'default': "'default'", 'max_length': '15'}),
            'price_field': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['eav.Attribute']", 'null': 'True', 'blank': 'True'}),
            'site': ('django.db.models.fields.CharField', [], {'max_length': '15'}),
            'template_file': ('elfinder.fields.ElfinderField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'})
        }
    }

    complete_apps = ['pdf_gen']