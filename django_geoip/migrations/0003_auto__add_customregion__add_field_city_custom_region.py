# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'CustomRegion'
        db.create_table(u'django_geoip_customregion', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('slug', self.gf('django.db.models.fields.SlugField')(max_length=200)),
        ))
        db.send_create_signal(u'django_geoip', ['CustomRegion'])

        # Adding field 'City.custom_region'
        db.add_column(u'django_geoip_city', 'custom_region',
                      self.gf('django.db.models.fields.related.ForeignKey')(to=orm['django_geoip.CustomRegion'], null=True, blank=True),
                      keep_default=False)


    def backwards(self, orm):
        # Deleting model 'CustomRegion'
        db.delete_table(u'django_geoip_customregion')

        # Deleting field 'City.custom_region'
        db.delete_column(u'django_geoip_city', 'custom_region_id')


    models = {
        u'django_geoip.city': {
            'Meta': {'unique_together': "(('region', 'name'),)", 'object_name': 'City'},
            'custom_region': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['django_geoip.CustomRegion']", 'null': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'latitude': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '9', 'decimal_places': '6', 'blank': 'True'}),
            'longitude': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '9', 'decimal_places': '6', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'region': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'cities'", 'to': u"orm['django_geoip.Region']"})
        },
        u'django_geoip.country': {
            'Meta': {'object_name': 'Country'},
            'code': ('django.db.models.fields.CharField', [], {'max_length': '2', 'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '255'})
        },
        u'django_geoip.customregion': {
            'Meta': {'object_name': 'CustomRegion'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'slug': ('django.db.models.fields.SlugField', [], {'max_length': '200'})
        },
        u'django_geoip.iprange': {
            'Meta': {'object_name': 'IpRange'},
            'city': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['django_geoip.City']", 'null': 'True'}),
            'country': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['django_geoip.Country']"}),
            'end_ip': ('django.db.models.fields.BigIntegerField', [], {'db_index': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'region': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['django_geoip.Region']", 'null': 'True'}),
            'start_ip': ('django.db.models.fields.BigIntegerField', [], {'db_index': 'True'})
        },
        u'django_geoip.region': {
            'Meta': {'unique_together': "(('country', 'name'),)", 'object_name': 'Region'},
            'country': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'regions'", 'to': u"orm['django_geoip.Country']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        }
    }

    complete_apps = ['django_geoip']