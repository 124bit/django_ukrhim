from django.http import HttpResponse
from django.core.mail import send_mail
from django.utils.translation import ugettext as _
from django.conf import settings
from django.contrib.sites.models import Site
from product_db.models import Product 
def call_req(request):
    if 'timelist' in request.POST:
        time_to_call=request.POST['timelist']
    else:
        time_to_call=_('now')
        
    number=request.POST['number']
    
    if 'receive_domain' in request.POST:
        receive_domain=request.POST['receive_domain']
    else:
        receive_domain=request.META['HTTP_HOST']
        if receive_domain[:4]=='www.':
            receive_domain=receive_domain[4:]
        if receive_domain.count('.')>1:
            receive_domain=receive_domain[receive_domain.find('.')+1:]
            
            
    if 'product' in request.POST:
        product=Product.objects.get(slug=request.POST['product']).name
    else:
        product=_('undefined product')
        
    
    if 'date' in request.POST:
        date = request.POST['date']
    else:
        date = ''
        
        
    
    mail_topic = _('Request for call from %(receive_domain)s for %(product)s') % {'receive_domain': receive_domain, 'product': product} 
    mail_text = _('Request for call at %(number)s for %(product)s. Call please to customer at %(time_to_call)s %(date)s.') % {'number': number, 'product': product, 'time_to_call': time_to_call, 'date': date}
    
    mail_text = mail_text + _('\n----------------------\nSincerely,\nBroide Julius I.,\nmarketing team Ltd. Ukrhimplast')
    
    site_text = _('Thanks, you have send request for call at %(time_to_call)s to \n%(number)s at %(date)s.\nWe will call you back at this time.') % { 'time_to_call': time_to_call, 'number': number, 'date': date}
    
    
    
    send_mail(mail_topic, mail_text , 'call_asker@ukrhimplast.com', ['sales@'+receive_domain], fail_silently=False)
    return HttpResponse(site_text)

def robots(request):
    subdomain=request.META['HTTP_HOST']
    if subdomain[:4]=='www.':
        subdomain=subdomain[4:]
    if subdomain.count('.')>=2:
        subdomain=subdomain[:subdomain.find('.')]
    else:
        subdomain=''
    site_cutting = Site.objects.get_current().site_cutting
    if subdomain:
        file_name= 'robots_'+site_cutting+'_'+subdomain+'.txt'
    else:
        file_name= 'robots_'+site_cutting+'.txt'
    robots_addr = settings.MEDIA_ROOT+'/files/site_spec/' + file_name  
    with open(robots_addr, 'r') as f:
        contents = f.readlines()
    return HttpResponse(contents)