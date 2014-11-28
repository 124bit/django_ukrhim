django_ukrhim
=============
It is monstrous, its code is really low quality, however it fully meets the business requirements.

Main components
  CMS
    Based on Divio django-cms 2.4. Implemented tons of additional features for using in multisite and multilanguage conditions:
    Solved the problem of convenient changes in common contents on many websites, without any limitations in editing and altering the site-individual content. Web-sites can have different structure.
    Quick and easy site creation for new department in new country on new domain with new language by short 1day-guide. Sites can be fully customized for national needs but have some similar texts, products and documentation. Updating such content will take effect at all sites which are using it. 
    Django template language for content editors.
    Draft\publish model with history and ability to revert changes.
    Dashboard for controlling content editors activities.
    Displaying a web-page content or sub-domain content depending on the user region. Creating sub-domains for regions in one click. Region can include multiple districts. User location determination by DjangoGeoIp.
    Cache invalidation
    and many more..

  PRODUCT DATABASE
    Entity-Attribute-Value (EAV) product storage with django admin interface integration. Adding new attributes of different types to products and product types on the fly.
    Many price-fields with different currencies for one product in many regions for different customers. Price-fields can be dependent.
    Flexible template system for product presentation.
    Frequently changing data import from xlsx.
    
  DOCUMENT GENERATION
    Complex pdf generation from odt templates and product attributes.
