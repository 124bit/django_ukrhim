# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Site'
        db.create_table('django_site', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('domain', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('site_cutting', self.gf('eav.fields.EavSlugField')(unique=True, max_length=14)),
            ('price_field_slugs', self.gf('django.db.models.fields.CharField')(max_length=70)),
        ))
        db.send_create_signal(u'sites', ['Site'])


    def backwards(self, orm):
        # Deleting model 'Site'
        db.delete_table('django_site')


    models = {
        u'sites.site': {
            'Meta': {'ordering': "('domain',)", 'object_name': 'Site', 'db_table': "'django_site'"},
            'domain': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'price_field_slugs': ('django.db.models.fields.CharField', [], {'max_length': '70'}),
            'site_cutting': ('eav.fields.EavSlugField', [], {'unique': 'True', 'max_length': '14'})
        }
    }

    complete_apps = ['sites']