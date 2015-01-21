# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'ProductType'
        db.create_table(u'product_db_producttype', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name_ru', self.gf('django.db.models.fields.CharField')(unique=True, max_length=30)),
            ('name_en', self.gf('django.db.models.fields.CharField')(unique=True, max_length=30)),
            ('slug', self.gf('eav.fields.EavSlugField')(unique=True, max_length=30)),
        ))
        db.send_create_signal(u'product_db', ['ProductType'])

        # Adding M2M table for field fields on 'ProductType'
        m2m_table_name = db.shorten_name(u'product_db_producttype_fields')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('producttype', models.ForeignKey(orm[u'product_db.producttype'], null=False)),
            ('attribute', models.ForeignKey(orm[u'eav.attribute'], null=False))
        ))
        db.create_unique(m2m_table_name, ['producttype_id', 'attribute_id'])

        # Adding model 'ProductTag'
        db.create_table(u'product_db_producttag', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name_ru', self.gf('django.db.models.fields.CharField')(unique=True, max_length=30)),
            ('name_en', self.gf('django.db.models.fields.CharField')(unique=True, max_length=30)),
            ('slug', self.gf('eav.fields.EavSlugField')(unique=True, max_length=30)),
        ))
        db.send_create_signal(u'product_db', ['ProductTag'])

        # Adding model 'Product'
        db.create_table(u'product_db_product', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name_ru', self.gf('django.db.models.fields.CharField')(unique=True, max_length=50)),
            ('name_en', self.gf('django.db.models.fields.CharField')(unique=True, max_length=50)),
            ('slug', self.gf('eav.fields.EavSlugField')(unique=True, max_length=60)),
            ('product_type', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['product_db.ProductType'], null=True, blank=True)),
            ('active', self.gf('django.db.models.fields.BooleanField')(default=True)),
            ('date_added', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('last_modified', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
        ))
        db.send_create_signal(u'product_db', ['Product'])

        # Adding M2M table for field additional_fields on 'Product'
        m2m_table_name = db.shorten_name(u'product_db_product_additional_fields')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('product', models.ForeignKey(orm[u'product_db.product'], null=False)),
            ('attribute', models.ForeignKey(orm[u'eav.attribute'], null=False))
        ))
        db.create_unique(m2m_table_name, ['product_id', 'attribute_id'])

        # Adding M2M table for field product_tags on 'Product'
        m2m_table_name = db.shorten_name(u'product_db_product_product_tags')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('product', models.ForeignKey(orm[u'product_db.product'], null=False)),
            ('producttag', models.ForeignKey(orm[u'product_db.producttag'], null=False))
        ))
        db.create_unique(m2m_table_name, ['product_id', 'producttag_id'])


    def backwards(self, orm):
        # Deleting model 'ProductType'
        db.delete_table(u'product_db_producttype')

        # Removing M2M table for field fields on 'ProductType'
        db.delete_table(db.shorten_name(u'product_db_producttype_fields'))

        # Deleting model 'ProductTag'
        db.delete_table(u'product_db_producttag')

        # Deleting model 'Product'
        db.delete_table(u'product_db_product')

        # Removing M2M table for field additional_fields on 'Product'
        db.delete_table(db.shorten_name(u'product_db_product_additional_fields'))

        # Removing M2M table for field product_tags on 'Product'
        db.delete_table(db.shorten_name(u'product_db_product_product_tags'))


    models = {
        u'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        u'eav.attribute': {
            'Meta': {'object_name': 'Attribute'},
            'created': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'datatype': ('eav.fields.EavDatatypeField', [], {'max_length': '15'}),
            'description_en': ('django.db.models.fields.CharField', [], {'max_length': '256', 'null': 'True', 'blank': 'True'}),
            'description_ru': ('django.db.models.fields.CharField', [], {'max_length': '256', 'null': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'importance': ('django.db.models.fields.IntegerField', [], {'default': '0', 'null': 'True', 'blank': 'True'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'name_en': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '100'}),
            'name_ru': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '100'}),
            'options': ('jsonfield.fields.JSONField', [], {'default': "'{}'", 'blank': 'True'}),
            'slug': ('eav.fields.EavSlugField', [], {'unique': 'True', 'max_length': '50'})
        },
        u'eav.value': {
            'Meta': {'object_name': 'Value'},
            'attribute': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['eav.Attribute']"}),
            'created': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'entity_ct': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'value_entities'", 'to': u"orm['contenttypes.ContentType']"}),
            'entity_id': ('django.db.models.fields.IntegerField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'value_bool': ('django.db.models.fields.NullBooleanField', [], {'null': 'True', 'blank': 'True'}),
            'value_date': ('django.db.models.fields.DateTimeField', [], {'null': 'True', 'blank': 'True'}),
            'value_enum': ('django.db.models.fields.CharField', [], {'max_length': '30', 'null': 'True', 'blank': 'True'}),
            'value_file': ('elfinder.fields.ElfinderField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'value_float': ('django.db.models.fields.FloatField', [], {'null': 'True', 'blank': 'True'}),
            'value_image': ('elfinder.fields.ElfinderField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'value_int': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'value_list': ('eav.fields.MultiSelectField', [], {'null': 'True', 'blank': 'True'}),
            'value_text': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'})
        },
        u'product_db.product': {
            'Meta': {'object_name': 'Product'},
            'active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'additional_fields': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['eav.Attribute']", 'symmetrical': 'False', 'blank': 'True'}),
            'date_added': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'last_modified': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'name_en': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '50'}),
            'name_ru': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '50'}),
            'product_tags': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['product_db.ProductTag']", 'symmetrical': 'False', 'blank': 'True'}),
            'product_type': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['product_db.ProductType']", 'null': 'True', 'blank': 'True'}),
            'slug': ('eav.fields.EavSlugField', [], {'unique': 'True', 'max_length': '60'})
        },
        u'product_db.producttag': {
            'Meta': {'object_name': 'ProductTag'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name_en': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '30'}),
            'name_ru': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '30'}),
            'slug': ('eav.fields.EavSlugField', [], {'unique': 'True', 'max_length': '30'})
        },
        u'product_db.producttype': {
            'Meta': {'object_name': 'ProductType'},
            'fields': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['eav.Attribute']", 'symmetrical': 'False', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name_en': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '30'}),
            'name_ru': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '30'}),
            'slug': ('eav.fields.EavSlugField', [], {'unique': 'True', 'max_length': '30'})
        }
    }

    complete_apps = ['product_db']