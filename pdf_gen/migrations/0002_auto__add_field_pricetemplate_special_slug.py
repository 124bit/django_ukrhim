# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding field 'PriceTemplate.special_slug'
        db.add_column('pdf_gen_pricetemplate', 'special_slug',
                      self.gf('django.db.models.fields.CharField')(default='', max_length=50, blank=True),
                      keep_default=False)


    def backwards(self, orm):
        # Deleting field 'PriceTemplate.special_slug'
        db.delete_column('pdf_gen_pricetemplate', 'special_slug')


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
            'price': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['pdf_gen.Price']"}),
            'site': ('django.db.models.fields.CharField', [], {'max_length': '15'}),
            'special_slug': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'template_file': ('elfinder.fields.ElfinderField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'})
        }
    }

    complete_apps = ['pdf_gen']