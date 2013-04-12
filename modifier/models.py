#not good code to patch only once, but it is first that come in my head
def run_once(f):
    '''
    CODE
        @run_once
        def func():
            print 'aa'

        func()

    will return 'aa'. Second run will return RuntimeWarning.
    '''
    def wrapper(*args, **kwargs):
        if not wrapper.has_run:
            wrapper.has_run = True
            return f(*args, **kwargs)
        else:
            raise RuntimeWarning('Monkey patches have benn applied twice')
    wrapper.has_run = False
    return wrapper


#run patches from patch.py
@run_once
def import_patches():
    import patches

import_patches()


#---------------------------------------------------------------------------
# Create our own superuser automatically after syncdb
from django.conf import settings
from django.contrib.auth import models as auth_models
from django.contrib.auth.management import create_superuser
from django.db.models import signals


signals.post_syncdb.disconnect(
    create_superuser,
    sender=auth_models,
    dispatch_uid='django.contrib.auth.management.create_superuser')




def create_testuser(app, created_models, verbosity, **kwargs):
    if not settings.DEBUG:
        return
    try:
        auth_models.User.objects.get(username='124bit')
    except auth_models.User.DoesNotExist:
        print '*' * 80
        print 'Creating test user -- login: 124bit, password: 777777'
        print '*' * 80
        assert auth_models.User.objects.create_superuser('124bit', '124bit@gmail.com', '777777')
    else:
        print 'Test user already exists.'

signals.post_syncdb.connect(create_testuser,
                            sender=auth_models, dispatch_uid='common.models.create_testuser')

#----------------------------------------------------------------------------
#----image_kit picture settings model
from jsonfield import JSONField
from django.db import models
from django.db.models import SlugField
from django.forms import ValidationError
from django.utils.translation import ugettext as _
from copy import deepcopy
from imagekit import register, unregister
from imagekit import ImageSpec
from imagekit.exceptions import AlreadyRegistered, NotRegistered

class ImageSpecModel(models.Model):
    name=SlugField(max_length=30, help_text=_("Image spec name"), verbose_name=_("Spec name"))
    specs=JSONField(verbose_name=_("Specific options"), default="{}" , blank=True, help_text=_("Image field options"))

    def __init__(self, *args, **kwargs):
        super(ImageSpecModel, self).__init__(*args, **kwargs)

        try:
            #registering specs to use in temlate by name
            #after this, use it as {% generateimage 'Spec_name' source=source_image %}
            register.generator(self.name, self.get_image_spec_class())
        except AlreadyRegistered:
            pass
        self.name_before_save=self.name

    def get_spec_dict(self):
            #put a dictionary of options
            #for list of options look her https://github.com/jdriscoll/django-imagekit
            #example: {
            #          "processors":"[]",
            #          "format"="JPEG",
            #          "options"={"quality":90}
            #          }
            #
        image_specs=deepcopy(self.specs)

        if 'processors' in image_specs:
            eval("image_specs['processors']="+image_specs['processors'])
        else:
            image_specs['processors']=[]

        if 'format' not in image_specs:
            image_specs['format']="JPEG"

        if 'options' not in image_specs:
            image_specs['options']={}

        return image_specs

    def get_image_spec_class(self):
        spec_dict=self.get_spec_dict()
        class Specs(ImageSpec):
            processors = spec_dict['processors']
            format = spec_dict['format']
            options = spec_dict['options']
        return Specs

    def save(self, *args, **kwargs):
        try:
            unregister.generator(self.name_before_save)
        except NotRegistered:
            pass

        try:
            specs_class=self.get_image_spec_class()
            register.generator(self.name, specs_class)
            self.name_before_save=self.name
        except Exception, e:
            raise  ValidationError(e)

        super(ImageSpecModel, self).save(*args, **kwargs)

    def __unicode__(self):
        return self.name



#----model for cms file plugin
from cms.models.pluginmodel import CMSPlugin
from elfinder.fields import ElfinderField

class ElfinderFileHolder(CMSPlugin):
    file_field = ElfinderField()


#------fixture for significant attributs

from eav.models import Attribute

try:
    if Attribute.objects.filter(slug="exclude_at_sites").count()==0:
        Attribute.objects.create(name=_('Show on sites'), slug='exclude_at_sites', datatype=Attribute.TYPE_LIST, description=_('Check on sites where  product must not be shown') , options={'site_list':1})
    if Attribute.objects.filter(slug="include_at_sites").count()==0:
        Attribute.objects.create(name=_('Exclude from sites'), slug='include_at_sites', datatype=Attribute.TYPE_LIST, description=_('Check on sites where product is shown') , options={'site_list':1})
except:
    pass