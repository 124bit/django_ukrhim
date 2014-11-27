# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Chunk'
        db.create_table(u'pdf_gen_chunk', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('slug', self.gf('eav.fields.EavSlugField')(unique=True, max_length=50)),
        ))
        db.send_create_signal(u'pdf_gen', ['Chunk'])

        # Adding model 'LangChunk'
        db.create_table(u'pdf_gen_langchunk', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('content', self.gf('django.db.models.fields.TextField')(null=True, blank=True)),
            ('styles', self.gf('django.db.models.fields.TextField')(null=True, blank=True)),
            ('fonts', self.gf('django.db.models.fields.TextField')(null=True, blank=True)),
            ('image', self.gf('elfinder.fields.ElfinderField')(max_length=600, null=True, blank=True)),
            ('chunk', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['pdf_gen.Chunk'], null=True, blank=True)),
            ('site', self.gf('django.db.models.fields.CharField')(max_length=15)),
            ('language', self.gf('django.db.models.fields.CharField')(default='default', max_length=15)),
        ))
        db.send_create_signal(u'pdf_gen', ['LangChunk'])


    def backwards(self, orm):
        # Deleting model 'Chunk'
        db.delete_table(u'pdf_gen_chunk')

        # Deleting model 'LangChunk'
        db.delete_table(u'pdf_gen_langchunk')


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
            'price_field2': ('django.db.models.fields.CharField', [], {'max_length': '40', 'null': 'True', 'blank': 'True'}),
            'site': ('django.db.models.fields.CharField', [], {'max_length': '15'}),
            'template_file': ('elfinder.fields.ElfinderField', [], {'max_length': '600', 'null': 'True', 'blank': 'True'})
        }
    }

    complete_apps = ['pdf_gen']