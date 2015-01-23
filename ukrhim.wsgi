#!/usr/bin/python
import os
import sys
import site


# Add the site-packages of the chosen virtualenv to work with
site.addsitedir('/srv/www/envs/django_ukrhim_env/lib/python2.7/site-packages')

# Add the app's directory to the PYTHONPATH
sys.path.append('/srv/www/django_ukrhim')
sys.path.append('/srv/www/django_ukrhim/django_ukrhim/')

os.environ['DJANGO_SETTINGS_MODULE'] = 'settings_ukrhim'

# Activate your virtual env
activate_env=os.path.expanduser("/srv/www/envs/django_ukrhim_env/bin/activate_this.py")
execfile(activate_env, dict(__file__=activate_env))

import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()

#import newrelic.agent
#newrelic.agent.initialize('/srv/www/django_ukrhim/newrelic_ukrhim.ini')
