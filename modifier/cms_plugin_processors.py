__author__ = 'Agafon'
from django.template import Context, Template
from django.contrib.sites.models import Site
from product_db.models import Product, ProductType, ProductTag


def render_with_tags(instance, placeholder, rendered_content, original_context):
    '''
    plugin processor fuction. Changes any plugins output. Renders output as django template,
    with context:
    'site': current site cutting
    'current cutting': 1 (for simple site detection with template if tag)
    '''


    #if error show it only in admin
    try:
        plugin_text=Template(rendered_content.replace('<pre>','').replace('</pre>',''))
    except Exception, exc_text:
        if original_context['request'].path.startswith('/admin'):
            return  exc_text
        else:
            return ''

    #todo brake to functions
    current_site=Site.objects.get_current()
    all_products=Product.objects.filter(active=True)
    site_products_ids=[]
    for product in all_products:
        try:
            if str(current_site.pk) not in product.include_at_sites:
                continue
        except AttributeError:
            pass
        #todo exclude_include slugs problem

        try:
            if str(current_site.pk) in product.exclude_at_sites:
                continue
        except AttributeError:
            pass
        site_products_ids.append(product.pk)

    site_products=all_products.filter(id__in=site_products_ids)


    plugin_context_dict={}
    plugin_context_dict['products']=site_products
    plugin_context_dict['all_products']=all_products

    #TODO make inique slugs
    for product in site_products:
        plugin_context_dict[product.slug]=product

    for product_tag in ProductTag.objects.all():
        plugin_context_dict['all_'+product_tag.slug]=all_products.filter(product_tags__in=product_tag)

    for product_type in ProductType.objects.all():
        plugin_context_dict['all_'+product_type.slug]=all_products.filter(product_type=product_type)


    for product_tag in ProductTag.objects.all():
        plugin_context_dict[product_tag.slug]=site_products.filter(product_tags_in=product_tag)

    for product_type in ProductType.objects.all():
        plugin_context_dict[product_type.slug]=site_products.filter(product_type=product_type)

    plugin_context_dict['site']=current_site.site_cutting
    plugin_context_dict[current_site.site_cutting]=1

    plugin_context = Context(plugin_context_dict)

    #todo try render
    return  plugin_text.render(plugin_context)
