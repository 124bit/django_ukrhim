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