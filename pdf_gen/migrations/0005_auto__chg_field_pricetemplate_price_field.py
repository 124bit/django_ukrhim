# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):

        # Renaming column for 'PriceTemplate.price_field' to match new field type.
        db.rename_column('pdf_gen_pricetemplate', 'price_field_id', 'price_field')
        # Changing field 'PriceTemplate.price_field'
        db.alter_column('pdf_gen_pricetemplate', 'price_field', self.gf('django.db.models.fields.CharField')(max_length=40, null=True))
        # Removing index on 'PriceTemplate', fields ['price_field']
        db.delete_index('pdf_gen_pricetemplate', ['price_field_id'])


    def backwards(self, orm):
        # Adding index on 'PriceTemplate', fields ['price_field']
        db.create_index('pdf_gen_pricetemplate', ['price_field_id'])


        # Renaming column for 'PriceTemplate.price_field' to match new field type.
        db.rename_column('pdf_gen_pricetemplate', 'price_field', 'price_field_id')
        # Changing field 'PriceTemplate.price_field'
        db.alter_column('pdf_gen_pricetemplate', 'price_field_id', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['eav.Attribute'], null=True))

    models = {
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
            'price': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['pdf_gen.Price']", 'null': 'True', 'blank': 'True'}),
            'price_field': ('django.db.models.fields.CharField', [], {'max_length': '40', 'null': 'True', 'blank': 'True'}),
            'site': ('django.db.models.fields.CharField', [], {'max_length': '15'}),
            'template_file': ('elfinder.fields.ElfinderField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'})
        }
    }

    complete_apps = ['pdf_gen']