"""
This file was generated with the custommenu management command, it contains
the classes for the admin menu, you can customize this class as you want.

To activate your custom menu add the following to your settings.py::
    ADMIN_TOOLS_MENU = 'django_ukrhimp.custom_menu.CustomMenu'
"""

from django.core.urlresolvers import reverse
from django.utils.translation import ugettext_lazy as _

from admin_tools.menu import items, Menu


class CustomMenu(Menu):
    """
    Custom Menu for django_ukrhimp admin site.
    """
    def __init__(self, **kwargs):
        Menu.__init__(self, **kwargs)
        self.children += [
            items.MenuItem(_('Main'), reverse('admin:index')),
            items.ModelList(
                _('Settings'),
                models=(
                        'product_db.models.ProductType',
                        'product_db.models.ProductTag',
                        'eav.models.Attribute',
                        'modifier.models.ImageSpecModel',
                        'pdf_gen.models.Chunk',
                        'django_geoip.models.CustomRegion',
                        'django.contrib.*',
                        )
            ),
            items.MenuItem(_('Load files'), '/admin/modifier/fileloader/add/'),
            items.MenuItem(_("On site"),'/')
        ]

    def init_with_context(self, context):
        """
        Use this method if you need to access the request context.
        """
        return super(CustomMenu, self).init_with_context(context)
