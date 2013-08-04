#!/usr/bin/env python
# vim: ai ts=4 sts=4 et sw=4 coding=utf-8
#
#    This software is derived from EAV-Django originally written and
#    copyrighted by Andrey Mikhaylenko <http://pypi.python.org/pypi/eav-django>
#
#    This is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Lesser General Public License as published
#    by the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This software is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Lesser General Public License for more details.
#
#    You should have received a copy of the GNU Lesser General Public License
#    along with EAV-Django.  If not, see <http://gnu.org/licenses/>.
'''
******
fields
******

Contains two custom fields:

* :class:`EavSlugField`
* :class:`EavDatatypeField`

Classes
-------
'''

import re

from django.db import models
from django.utils.translation import ugettext_lazy as _
from django.core.exceptions import ValidationError

from south.modelsinspector import add_introspection_rules

class EavSlugField(models.SlugField):
    '''
    The slug field used by :class:`~eav.models.Attribute`
    '''

    def validate(self, value, instance):
        '''
        Slugs are used to convert the Python attribute name to a database
        lookup and vice versa. We need it to be a valid Python identifier.
        We don't want it to start with a '_', underscore will be used
        var variables we don't want to be saved in db.
        '''
        super(EavSlugField, self).validate(value, instance)
        slug_regex = r'[a-z][a-z0-9_]*'
        if not re.match(slug_regex, value) or '__' in value or '-' in value:
            raise ValidationError(_(u"Must be all lower case, " \
                                    u"start with a letter, and contain " \
                                    u"only letters, numbers, or underscores. Must not contain '__'"))

    @staticmethod
    def create_slug_from_name(name):
        '''
        Creates a slug based on the name
        '''
        name = name.strip().lower()

        # Change spaces to underscores
        name = '_'.join(name.split(' '))

        # Remove non alphanumeric characters
        return re.sub('[^\w]', '', name)


add_introspection_rules([], ["^eav\.fields\.EavSlugField"])

class EavDatatypeField(models.CharField):
    '''
    The datatype field used by :class:`~eav.models.Attribute`
    '''

    def validate(self, value, instance):
        '''
        Raise ``ValidationError`` if they try to change the datatype of an
        :class:`~eav.models.Attribute` that is already used by
        :class:`~eav.models.Value` objects.
        '''
        super(EavDatatypeField, self).validate(value, instance)
        from .models import Attribute
        if not instance.pk:
            return

add_introspection_rules([], ["^eav\.fields\.EavDatatypeField"])

from django import forms
from django.utils.text import capfirst
from django.core import exceptions


class MultiSelectFormField(forms.MultipleChoiceField):
    widget = forms.CheckboxSelectMultiple

    def __init__(self, *args, **kwargs):
        if 'widget' in kwargs:
            self.widget=kwargs['widget']
        self.max_choices = kwargs.pop('max_choices', 0)
        super(MultiSelectFormField, self).__init__(*args, **kwargs)

    def clean(self, value):
        if not value and self.required:
            raise forms.ValidationError(self.error_messages['required'])
            # if value and self.max_choices and len(value) > self.max_choices:
        #     raise forms.ValidationError('You must select a maximum of %s choice%s.'
        #             % (apnumber(self.max_choices), pluralize(self.max_choices)))
        return value


class MultiSelectField(models.TextField):
    __metaclass__ = models.SubfieldBase

    def get_internal_type(self):
        return "TextField"

    def get_choices_default(self):
        return self.get_choices(include_blank=False)

    def _get_FIELD_display(self, field):
        value = getattr(self, field.attname)
        choicedict = dict(field.choices)

    def formfield(self, **kwargs):
        # don't call super, as that overrides default widget if it has choices
        defaults = {'required': not self.blank, 'label': capfirst(self.verbose_name),
                    'help_text': self.help_text, 'choices': self.choices}
        if self.has_default():
            defaults['initial'] = self.get_default()
        defaults.update(kwargs)
        return MultiSelectFormField(**defaults)

    def get_prep_value(self, value):
        return value

    def get_db_prep_value(self, value, connection=None, prepared=False):
        if isinstance(value, basestring):
            return value
        elif isinstance(value, list):
            return ",".join(value)

    def to_python(self, value):
        if value is not None:
            return value if isinstance(value, list) else value.split(',')
        return ''

    def contribute_to_class(self, cls, name):
        super(MultiSelectField, self).contribute_to_class(cls, name)
        if self.choices:
            func = lambda self, fieldname = name, choicedict = dict(self.choices): ",".join([choicedict.get(value, value) for value in getattr(self, fieldname)])
            setattr(cls, 'get_%s_display' % self.name, func)

    def validate(self, value, model_instance):
      #  arr_choices = self.get_choices_selected(self.get_choices_default())
       # for opt_select in value:
      #      if (int(opt_select) not in arr_choices):  # the int() here is for comparing with integer choices
      #          raise exceptions.ValidationError(self.error_messages['invalid_choice'] % value)
        return

    def get_choices_selected(self, arr_choices=''):
        if not arr_choices:
            return False
        list = []
        for choice_selected in arr_choices:
            list.append(choice_selected[0])
        return list

    def value_to_string(self, obj):
        value = self._get_val_from_obj(obj)
        return self.get_db_prep_value(value)


# needed for South compatibility

add_introspection_rules([], ["^eav\.fields\.MultiSelectField"])