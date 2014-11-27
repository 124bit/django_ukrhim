# -*- coding: utf-8 -*-
from __future__ import with_statement
from cms.apphook_pool import apphook_pool
from cms.appresolver import get_app_urls
from cms.models import Title
from cms.utils import get_template_from_request, get_language_from_request
from cms.utils.i18n import get_fallback_languages, force_language, get_public_languages, get_redirect_on_fallback, get_language_list, is_language_prefix_patterns_used
from cms.utils.page_resolver import get_page_from_request
from cms.test_utils.util.context_managers import SettingsOverride
from django.conf import settings
from django.conf.urls.defaults import patterns
from django.core.urlresolvers import resolve, Resolver404, reverse
from django.http import Http404, HttpResponseRedirect, HttpResponsePermanentRedirect
from django.shortcuts import render_to_response
from django.template.context import RequestContext
from django.utils import translation
from django.utils.http import urlquote
from cms.templatetags import cms_tags
from django.contrib.sites.models import Site
from modifier.context_processors import location

def _handle_no_page(request, slug):
    if not slug and settings.DEBUG:
        return render_to_response("cms/new.html", RequestContext(request))
    raise Http404('CMS: Page not found for "%s"' % slug)


def details(request, slug):
    """
    The main view of the Django-CMS! Takes a request and a slug, renders the
    page.
    """
    # get the right model
    context = RequestContext(request)
    
    subdomain=request.META['HTTP_HOST'] 
    if subdomain[:4]=='www.':
        subdomain=subdomain[4:]
    if (subdomain[-6:]=='com.ua' and subdomain.count('.')>=3) or (subdomain[-6:]!='com.ua' and subdomain.count('.')>=2):
        subdomain=subdomain[:subdomain.find('.')]
    else:
        subdomain=''
    
    
    main_domain=request.META['HTTP_HOST']
    if subdomain!='':
        main_domain=main_domain[len(subdomain)+1:]
    

    if subdomain and subdomain!='etalon' and not subdomain.endswith('dev'):
        try:
            obl=Site.objects.get_current().obl.get(subdomain=subdomain)
        except:
            return HttpResponseRedirect('http://'+main_domain+request.get_full_path())
    else:
        if request.location and request.location.custom_region:
            try:
                obl=Site.objects.get_current().obl.get(slug=request.location.custom_region.slug)
                return HttpResponseRedirect('http://'+request.location.custom_region.subdomain+'.'+main_domain+request.get_full_path())
            except:
                pass
            
            
#    import logging
#    logging.info('dm='+request.META['HTTP_HOST'])
#    logging.info('sbd='+subdomain)
#    logging.info('mdm='+main_domain)
 #   logging.info('loc='+location(request)['loc'])
#    
    
    
    # Get a Page model object from the request
    page = get_page_from_request(request, use_path=slug)
    if not page:
        return _handle_no_page(request, slug)

    current_language = get_language_from_request(request)
    # Check that the current page is available in the desired (current) language
    available_languages = []
    page_languages = page.get_languages()
    user_languages = get_public_languages()
    if hasattr(request, 'user') and request.user.is_staff:
        user_languages = get_language_list()
    for frontend_lang in user_languages:
        if frontend_lang in page_languages:
            available_languages.append(frontend_lang)
    attrs = ''
    if 'edit' in request.GET:
        attrs = '?edit=1'
    elif 'preview' in request.GET:
        attrs = '?preview=1'
        if 'draft' in request.GET:
            attrs += '&draft=1'
    # Check that the language is in FRONTEND_LANGUAGES:
    if not current_language in user_languages:
        #are we on root?
        if not slug:
            #redirect to supported language
            languages = []
            for language in available_languages:
                languages.append((language, language))
            if languages:
                with SettingsOverride(LANGUAGES=languages, LANGUAGE_CODE=languages[0][0]):
                    #get supported language
                    new_language = get_language_from_request(request)
                    if new_language in get_public_languages():
                        with force_language(new_language):
                            pages_root = reverse('pages-root')
                            return HttpResponseRedirect(pages_root + attrs)
            else:
                _handle_no_page(request, slug)
        else:
            return _handle_no_page(request, slug)
    
    if current_language not in available_languages:
        # If we didn't find the required page in the requested (current)
        # language, let's try to find a fallback
        found = False
        for alt_lang in get_fallback_languages(current_language):
            if alt_lang in available_languages:
                if get_redirect_on_fallback(current_language):
                    with force_language(alt_lang):
                        path = page.get_absolute_url(language=alt_lang, fallback=True)
                        # In the case where the page is not available in the
                    # preferred language, *redirect* to the fallback page. This
                    # is a design decision (instead of rendering in place)).
                    return HttpResponseRedirect(path + attrs)
                else:
                    found = True
        if not found:
            # There is a page object we can't find a proper language to render it
            _handle_no_page(request, slug)
    
    if apphook_pool.get_apphooks():
        # There are apphooks in the pool. Let's see if there is one for the
        # current page
        # since we always have a page at this point, applications_page_check is
        # pointless
        # page = applications_page_check(request, page, slug)
        # Check for apphooks! This time for real!
        try:
            app_urls = page.get_application_urls(current_language, False)
        except Title.DoesNotExist:
            app_urls = []
        if app_urls:
            app = apphook_pool.get_apphook(app_urls)
            pattern_list = []
            for urlpatterns in get_app_urls(app.urls):
                pattern_list += urlpatterns
            urlpatterns = patterns('', *pattern_list)
            try:
                context.current_app = page.reverse_id if page.reverse_id else app.app_name
                view, args, kwargs = resolve('/', tuple(urlpatterns))
                return view(request, *args, **kwargs)
            except Resolver404:
                pass
        # Check if the page has a redirect url defined for this language.
    
    redirect_url = page.get_redirect(language=current_language)
    if redirect_url:
        if redirect_url.startswith('reverse_id:'): 
            slug=cms_tags._get_page_by_untyped_arg(redirect_url.split(':')[1], request, Site.objects.get_current().id).get_absolute_url()
            return HttpResponsePermanentRedirect(slug)
        else:
            if (is_language_prefix_patterns_used() and redirect_url[0] == "/"
                and not redirect_url.startswith('/%s/' % current_language)):
                # add language prefix to url
                redirect_url = "/%s/%s" % (current_language, redirect_url.lstrip("/"))
                # prevent redirect to self
            own_urls = [
                'http%s://%s%s' % ('s' if request.is_secure() else '', request.get_host(), request.path),
                '/%s' % request.path,
                request.path,
            ]            
            if redirect_url not in own_urls:
                return HttpResponsePermanentRedirect(redirect_url + attrs)

    # permission checks
    if page.login_required and not request.user.is_authenticated():
        path = urlquote(request.get_full_path())
        tup = settings.LOGIN_URL, "next", path
        return HttpResponseRedirect('%s?%s=%s' % tup)

    template_name = get_template_from_request(request, page, no_current_page=True)
    # fill the context 
    context['lang'] = current_language
    context['current_page'] = page
    context['has_change_permissions'] = page.has_change_permission(request)
    context['has_view_permissions'] = page.has_view_permission(request)

    if not context['has_view_permissions']:
        return _handle_no_page(request, slug)

    return render_to_response(template_name, context_instance=context)
