# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):

        # Changing field 'PriceTemplate.template_file'
        db.alter_column(u'pdf_gen_pricetemplate', 'template_file', self.gf('elfinder.fields.ElfinderField')(max_length=300, null=True))

    def backwards(self, orm):

        # Changing field 'PriceTemplate.template_file'
        db.alter_column(u'pdf_gen_pricetemplate', 'template_file', self.gf('elfinder.fields.ElfinderField')(max_length=100, null=True))

    models = {
        u'pdf_gen.price': {
            'Meta': {'object_name': 'Price'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'last_update': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(1980, 2, 2, 0, 0)'}),
            'name': ('eav.fields.EavSlugField', [], {'unique': 'True', 'max_length': '50'})
        },
        u'pdf_gen.pricetemplate': {
            'Meta': {'object_name': 'PriceTemplate'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'language': ('django.db.models.fields.CharField', [], {'default': "'default'", 'max_length': '15'}),
            'price': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['pdf_gen.Price']", 'null': 'True', 'blank': 'True'}),
            'price_field': ('django.db.models.fields.CharField', [], {'max_length': '40', 'null': 'True', 'blank': 'True'}),
            'site': ('django.db.models.fields.CharField', [], {'max_length': '15'}),
            'template_file': ('elfinder.fields.ElfinderField', [], {'max_length': '300', 'null': 'True', 'blank': 'True'})
        }
    }

    complete_apps = ['pdf_gen']