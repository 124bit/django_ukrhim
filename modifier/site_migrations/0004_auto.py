# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding M2M table for field obl on 'Site'
        m2m_table_name = db.shorten_name('django_site_obl')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('site', models.ForeignKey(orm[u'sites.site'], null=False)),
            ('customregion', models.ForeignKey(orm[u'django_geoip.customregion'], null=False))
        ))
        db.create_unique(m2m_table_name, ['site_id', 'customregion_id'])


    def backwards(self, orm):
        # Removing M2M table for field obl on 'Site'
        db.delete_table(db.shorten_name('django_site_obl'))


    models = {
        u'django_geoip.customregion': {
            'Meta': {'object_name': 'CustomRegion'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'slug': ('django.db.models.fields.SlugField', [], {'max_length': '200'})
        },
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
            'obl': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['django_geoip.CustomRegion']", 'symmetrical': 'False', 'blank': 'True'}),
            'price_field_slugs': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'site_cutting': ('eav.fields.EavSlugField', [], {'unique': 'True', 'max_length': '14'})
        }
    }

    complete_apps = ['sites']