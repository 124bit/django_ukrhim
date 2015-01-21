from django.utils.translation import ugettext as _
from django.db import models

from cms.models import CMSPlugin

class CMSCharFieldPlugin(CMSPlugin):
    body = models.CharField('',max_length=500)

    def __unicode__(self):
        return u'%s' % (self.body,)

class CMSTextFieldPlugin(CMSPlugin):
    body = models.TextField('')

    def __unicode__(self):
        return u'%s' % (self.body)
