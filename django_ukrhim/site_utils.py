from django.http import HttpResponseRedirect
import sys
from django.views.debug import technical_404_response
def handler404(request):
    if (request.user.is_active and request.user.is_staff) or request.user.is_superuser:
        exc_type, exc_value, tb = sys.exc_info()
        return technical_404_response(request, exc_value)
    else:
        return HttpResponseRedirect("/")