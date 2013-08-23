# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding field 'Site.company'
        db.add_column('django_site', 'company',
                      self.gf('django.db.models.fields.CharField')(default='comp', max_length=70),
                      keep_default=False)

        # Adding field 'Site.country'
        db.add_column('django_site', 'country',
                      self.gf('django.db.models.fields.CharField')(default='countr', max_length=70),
                      keep_default=False)


        # Changing field 'Site.price_field_slugs'
        db.alter_column('django_site', 'price_field_slugs', self.gf('django.db.models.fields.CharField')(max_length=200))

    def backwards(self, orm):
        # Deleting field 'Site.company'
        db.delete_column('django_site', 'company')

        # Deleting field 'Site.country'
        db.delete_column('django_site', 'country')


        # Changing field 'Site.price_field_slugs'
        db.alter_column('django_site', 'price_field_slugs', self.gf('django.db.models.fields.CharField')(max_length=70))

    models = {
        u'sites.site': {
            'Meta': {'ordering': "('domain',)", 'object_name': 'Site', 'db_table': "'django_site'"},
            'company': ('django.db.models.fields.CharField', [], {'max_length': '70'}),
            'country': ('django.db.models.fields.CharField', [], {'max_length': '70'}),
            'domain': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'price_field_slugs': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'site_cutting': ('eav.fields.EavSlugField', [], {'unique': 'True', 'max_length': '14'})
        }
    }

    complete_apps = ['sites']