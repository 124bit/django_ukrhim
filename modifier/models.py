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
from django.utils.translation import ugettext as _
from copy import deepcopy
from imagekit.registry import generator_registry
from imagekit import ImageSpec
from pilkit.processors import *
from eav.fields import EavSlugField
from PIL import ImageMath

#threshold - color distance from 0 to 1000
class TransparentBg(object):
    def __init__(self,color, threshold=0.3):
        self.thresh2=threshold * 195075/1000
        self.color=color

    @staticmethod
    def distance2(a, b):
        return (a[0] - b[0])**2 + (a[1] - b[1])**2 + (a[2] - b[2])**2

    def process(self, image):
        image = image.convert("RGBA")
        red, green, blue, alpha = image.split()
        image.putalpha(ImageMath.eval("""convert(((((t - d(c, (r, g, b))) >> 31) + 1) ^ 1) * a, 'L')""",
            t=self.thresh2, d=self.distance2, c=self.color, r=red, g=green, b=blue, a=alpha))
        return image

class ImageSpecModel(models.Model):
    name=EavSlugField(max_length=30, help_text=_("Image specifications profiles are used for automatic image generation in templates."), verbose_name=_("Profile name"))
    specs=JSONField(verbose_name=_("Options"), default="{}" , blank=True, help_text=_("Options of image convertation."))

    class Meta:
        verbose_name = _('image specification profile')
        verbose_name_plural = _('Image specification profiles')

    def __init__(self, *args, **kwargs):
        super(ImageSpecModel, self).__init__(*args, **kwargs)
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
            image_specs['processors']=eval(image_specs['processors'])
        else:
            image_specs['processors']=[]

        if 'format' not in image_specs:
            image_specs['format']="JPEG"

        if 'options' not in image_specs:
            image_specs['options']={}

        return image_specs

    def get_image_spec_class(self):
        spec_dict=self.get_spec_dict()
        def spec_creater(specs):
            class Specs(ImageSpec):
                processors = specs['processors']
                format = specs['format']
                options = specs['options']
            return Specs
        return spec_creater(spec_dict)


    def save(self, *args, **kwargs):
        if self.name_before_save in generator_registry._generators:
            generator_registry.unregister(self.name_before_save)


        super(ImageSpecModel, self).save(*args, **kwargs)
        generator_registry.register(self.name,self.get_image_spec_class())
        self.name_before_save=self.name

    def __unicode__(self):
        return self.name



#----model for cms file and image plugin
from cms.models.pluginmodel import CMSPlugin
from cms.plugin_base import CMSPluginBase
from elfinder.fields import ElfinderField
from django.db.models import ForeignKey, BooleanField,CharField,TextField
from django import forms

class ElfinderFileHolder(CMSPlugin):
    file_field = ElfinderField()
    def __unicode__(self):
        return self.file_field.url




class ElfinderPictureHolder(CMSPlugin):
    #todo write help

    file_field = ElfinderField(optionset='image',verbose_name=_("Choose image"))

    LOGIC_CHOICES=(
        ('1', _('Generate <img> tag with attrs.')),
        ('2', _('Get <img> tag with original url.')),
        ('3', _('Generate image url to variable.')),
        ('4', _('Get original image url.')),
    )

    logic = CharField(_("Choose logic"), max_length=10, choices=LOGIC_CHOICES)

    html_tags = TextField(_("Image html tags"), blank=True)
    generator = ForeignKey(ImageSpecModel,verbose_name=_("Choose convertation options"),blank=True, null=True)
    var_name= CharField(_("Variable name"), max_length=20, blank=True)

    def __unicode__(self):
        return self.file_field.url



class ElfinderPictureHolderForm(CMSPluginBase):
    class Meta:
        model = ElfinderPictureHolder
        widgets = {'gender': forms.RadioSelect()}

#------fixture for significant attributs

#from eav.models import Attribute

# try:
#     if Attribute.objects.filter(slug="exclude_at_sites").count()==0:
#         Attribute.objects.create(name=_('Show on sites'), slug='exclude_at_sites', datatype=Attribute.TYPE_LIST, description=_('Check on sites where product must not be shown.') , options={'site_list':1})
#     if Attribute.objects.filter(slug="include_at_sites").count()==0:
#         Attribute.objects.create(name=_('Exclude from sites'), slug='include_at_sites', datatype=Attribute.TYPE_LIST, description=_('Check on sites where product is shown.') , options={'site_list':1})
# except:
#     pass
