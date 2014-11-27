# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding field 'PriceTemplate.price_field3'
        db.add_column(u'pdf_gen_pricetemplate', 'price_field3',
                      self.gf('django.db.models.fields.CharField')(max_length=40, null=True, blank=True),
                      keep_default=False)


    def backwards(self, orm):
        # Deleting field 'PriceTemplate.price_field3'
        db.delete_column(u'pdf_gen_pricetemplate', 'price_field3')


    models = {
        u'pdf_gen.chunk': {
            'Meta': {'object_name': 'Chunk'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'slug': ('eav.fields.EavSlugField', [], {'unique': 'True', 'max_length': '50'})
        },
        u'pdf_gen.langchunk': {
            'Meta': {'object_name': 'LangChunk'},
            'chunk': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['pdf_gen.Chunk']", 'null': 'True', 'blank': 'True'}),
            'content': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'fonts': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'image': ('elfinder.fields.ElfinderField', [], {'max_length': '600', 'null': 'True', 'blank': 'True'}),
            'language': ('django.db.models.fields.CharField', [], {'default': "'default'", 'max_length': '15'}),
            'site': ('django.db.models.fields.CharField', [], {'max_length': '15'}),
            'styles': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'})
        },
        u'pdf_gen.price': {
            'Meta': {'object_name': 'Price'},
            'head_name': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'head_name_en': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'head_name_ru': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'last_update': ('django.db.models.fields.TextField', [], {'default': "'Price never generated'"}),
            'name': ('eav.fields.EavSlugField', [], {'unique': 'True', 'max_length': '50'}),
            'price_page': ('eav.fields.EavSlugField', [], {'max_length': '100'})
        },
        u'pdf_gen.pricetemplate': {
            'Meta': {'object_name': 'PriceTemplate'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'language': ('django.db.models.fields.CharField', [], {'default': "'default'", 'max_length': '15'}),
            'price': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['pdf_gen.Price']", 'null': 'True', 'blank': 'True'}),
            'price_field': ('django.db.models.fields.CharField', [], {'max_length': '40', 'null': 'True', 'blank': 'True'}),
            'price_field2': ('django.db.models.fields.CharField', [], {'max_length': '40', 'null': 'True', 'blank': 'True'}),
            'price_field3': ('django.db.models.fields.CharField', [], {'max_length': '40', 'null': 'True', 'blank': 'True'}),
            'site': ('django.db.models.fields.CharField', [], {'max_length': '15'}),
            'template_file': ('elfinder.fields.ElfinderField', [], {'max_length': '600', 'null': 'True', 'blank': 'True'})
        }
    }

    complete_apps = ['pdf_gen']