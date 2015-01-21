__author__ = 'Agafon'


from django.contrib import admin
from models import *

#TODO save validation error. unregister
admin.site.register(ImageSpecModel)
admin.site.register(FileLoader)