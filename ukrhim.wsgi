#!/usr/bin/env python
import os
import sys

os.chdir("/srv/www/django_ukrhim/")
sys.path.append('/srv/www/django_ukrhim')
sys.path.append('/srv/www/django_ukrhim/cms/')
sys.path.append('/srv/www/django_ukrhim/imagekit/')
sys.path.append('/usr/lib/python27.zip')
sys.path.append('/usr/lib/python2.7')
sys.path.append('/usr/lib/python2.7/plat-linux2')
sys.path.append('/usr/lib/python2.7/lib-tk')
sys.path.append('/usr/lib/python2.7/lib-old')
sys.path.append('/usr/lib/python2.7/lib-dynload')
sys.path.append('/usr/lib/python2.7/site-packages')
sys.path.append('/usr/lib/python2.7/site-packages/PIL')
sys.path.append('/usr/local/lib/python2.7/site-packages')
sys.path.append('/srv/www/django_ukrhim/django_ukrhim/')
os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'
os.chdir("/srv/www/django_ukrhim/")

import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()
