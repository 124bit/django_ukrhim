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
#####
forms
#####

The forms used for admin integration

Classes
-------
'''
from copy import deepcopy

from django.forms import BooleanField, CharField, DateTimeField, FloatField, \
                         IntegerField, ModelForm, ChoiceField, ValidationError
from django.contrib.admin.widgets import AdminSplitDateTime
from django.utils.translation import ugettext as _

from os import listdir, path
from django.core.files.storage import FileSystemStorage
from django.conf import  settings
from django.contrib.sites.models import Site

class BaseDynamicEntityForm(ModelForm):
    '''
    ModelForm for entity with support for EAV attributes. Form fields are
    created on the fly depending on Schema defined for given entity instance.
    If no schema is defined (i.e. the entity instance has not been saved yet),
    only static fields are used. However, on form validation the schema will be
    retrieved and EAV fields dynamically added to the form, so when the
    validation is actually done, all EAV fields are present in it (unless
    Rubric is not defined).
    '''



    def __init__(self, data=None, *args, **kwargs):
        super(BaseDynamicEntityForm, self).__init__(data, *args, **kwargs)
        config_cls = self.instance._eav_config_cls
        self.entity = getattr(self.instance, config_cls.eav_attr)

        self.secondary_fields=self.instance.get_secondary_attributes()

        self._build_dynamic_fields()

    def _build_dynamic_fields(self):
        # reset form fields
        self.fields = deepcopy(self.base_fields)


        for attribute in self.secondary_fields:
            value = getattr(self.entity, attribute.slug)

            # fill initial data (if attribute was already defined)
            if value:
                self.initial[attribute.slug] = value

            defaults = {
                'label': attribute.name,
                'required': False,
                'help_text': attribute.help_text,
                'validators': attribute.get_validators(),
            }


            if attribute.datatype == attribute.TYPE_ENUM:
                if 'choices' in attribute.options:
                    choices = attribute.options['choices'].items()
                else:
                    choices = [('', '-----')]
                defaults.update({'choices': choices})

            elif attribute.datatype == attribute.TYPE_DATE:
                defaults.update({'widget': AdminSplitDateTime})
            elif attribute.datatype == attribute.TYPE_OBJECT:
                continue
            elif attribute.datatype==attribute.TYPE_IMAGE:
                defaults["optionset"]="image"
                defaults["start_path"]="files"
            elif attribute.datatype==attribute.TYPE_FILE:
                defaults["optionset"]="default"
                defaults["start_path"]="files"
            elif attribute.datatype==attribute.TYPE_LIST:
                if 'image_list' in attribute.options:
                    list_options=attribute.options['image_list']
                    folder_path=''
                    if "image_folder" in list_options:
                        if 'path' in  list_options['image_folder']:
                            folder_path=list_options['image_folder']['path']
                        elif 'field' in  list_options['image_folder']:
                            try:
                                file_path=getattr(self.entity, list_options['choices_folder']['field']).url
                                folder_path=path.dirname(file_path[1:])
                            except AttributeError:
                                pass
                    else:
                        for field in self.secondary_fields:
                            if field.datatype==attribute.TYPE_FILE or field.datatype==attribute.TYPE_IMAGE:

                                try:
                                    file_path=getattr(self.entity, field.slug).url
                                    folder_path=path.dirname(file_path[1:])
                                    break
                                except AttributeError:
                                    pass
                    if folder_path=='':
                        choices = []
                    else:
                        folder_path =path.join(settings.PROJECT_PATH, folder_path)
                        print folder_path
                        choices = [ (path.join(folder_path,file_name),file_name) for file_name in listdir(folder_path) if path.isfile(path.join(folder_path,file_name)) ]

                elif 'site_list' in attribute.options:
                    choices = [(site.pk, site.name) for site in Site.objects.all()]

                defaults.update({'choices': choices})



            options=defaults.copy()
            if attribute.options:
                if 'field_options' in attribute.options:
                    for option in attribute.options['field'].keys():
                        options[option]=attribute.options['field'][option]


            MappedField = attribute.FIELD_CLASSES[attribute.datatype]
            try:
                self.fields[attribute.slug] = MappedField(**options)
            except TypeError:
                defaults["help_text"]+=_('<br>ERROR IN FIELD OPTIONS!')
                self.fields[attribute.slug] = MappedField(**defaults)



    def save(self, commit=True):
        """
        Saves this ``form``'s cleaned_data into model instance
        ``self.instance`` and related EAV attributes.

        Returns ``instance``.
        """

        if self.errors:
            raise ValueError(_(u"The %s could not be saved because the data"
                             u"didn't validate.") % \
                             self.instance._meta.object_name)


        # create entity instance, don't save yet
        instance = super(BaseDynamicEntityForm, self).save(commit=False)

        # assign attributes
        for attribute in self.secondary_fields:
            value = self.cleaned_data.get(attribute.slug)
            setattr(self.entity, attribute.slug, value)

        # save entity and its attributes
        if commit:
            instance.save()

        return instance
