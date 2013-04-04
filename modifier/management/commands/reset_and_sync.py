__author__ = 'Agafon'

from django.core.management.base import BaseCommand, CommandError
from django.core.management import call_command
import os
class Command(BaseCommand):
    args = 'no args'


    def handle(self, *args, **options):
        call_command('reset_db')
        os.system('python manage.py syncdb --all')