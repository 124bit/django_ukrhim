__author__ = 'Agafon'
import os
def url_to_path(url):
    return 'django_ukrhim' + url.replace('/', os.sep)
def path_to_url(path):
    pass