# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding field 'Site.company_en'
        db.add_column('django_site', 'company_en',
                      self.gf('django.db.models.fields.CharField')(max_length=70, null=True, blank=True),
                      keep_default=False)

        # Adding field 'Site.company_ru'
        db.add_column('django_site', 'company_ru',
                      self.gf('django.db.models.fields.CharField')(max_length=70, null=True, blank=True),
                      keep_default=False)

        # Adding field 'Site.country_en'
        db.add_column('django_site', 'country_en',
                      self.gf('django.db.models.fields.CharField')(max_length=70, null=True, blank=True),
                      keep_default=False)

        # Adding field 'Site.country_ru'
        db.add_column('django_site', 'country_ru',
                      self.gf('django.db.models.fields.CharField')(max_length=70, null=True, blank=True),
                      keep_default=False)


    def backwards(self, orm):
        # Deleting field 'Site.company_en'
        db.delete_column('django_site', 'company_en')

        # Deleting field 'Site.company_ru'
        db.delete_column('django_site', 'company_ru')

        # Deleting field 'Site.country_en'
        db.delete_column('django_site', 'country_en')

        # Deleting field 'Site.country_ru'
        db.delete_column('django_site', 'country_ru')


    models = {
        u'sites.site': {
            'Meta': {'ordering': "('domain',)", 'object_name': 'Site', 'db_table': "'django_site'"},
            'company': ('django.db.models.fields.CharField', [], {'max_length': '70'}),
            'company_en': ('django.db.models.fields.CharField', [], {'max_length': '70', 'null': 'True', 'blank': 'True'}),
            'company_ru': ('django.db.models.fields.CharField', [], {'max_length': '70', 'null': 'True', 'blank': 'True'}),
            'country': ('django.db.models.fields.CharField', [], {'max_length': '70'}),
            'country_en': ('django.db.models.fields.CharField', [], {'max_length': '70', 'null': 'True', 'blank': 'True'}),
            'country_ru': ('django.db.models.fields.CharField', [], {'max_length': '70', 'null': 'True', 'blank': 'True'}),
            'domain': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'price_field_slugs': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'site_cutting': ('eav.fields.EavSlugField', [], {'unique': 'True', 'max_length': '14'})
        }
    }

    complete_apps = ['sites']