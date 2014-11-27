from django.contrib.admin import TabularInline, StackedInline
from django.conf import settings

class OrderableStackedInline(StackedInline):
    
    """Adds necessary media files to regular Django StackedInline"""
    
    class Media:
        js = ( settings.STATIC_URL+'stacked_inline/admin_jqueryui.min.js', settings.STATIC_URL+'stacked_inline/inline_ordering.js')


class OrderableTabularInline(TabularInline):
    
    """Adds necessary media files to regular Django TabularInline"""
    
    class Media:
       js = (  settings.STATIC_URL+'stacked_inline/admin_jqueryui.min.js', settings.STATIC_URL+'stacked_inline/inline_ordering.js')