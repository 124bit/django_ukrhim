django_ukrhim - LLC "Ukrhimplast" corporate portal
=============
<p>It is monstrous, its code is really low quality, however it fully meets the business requirements. Documentation is in Russian so I'll describe only main components:</p>

  <h3>CMS</h3>
    <p>Based on Divio django-cms 2.4. Implemented tons of additional features for using in multisite and multilanguage conditions:</p>
    <ul>
    <li>Solved the problem of convenient changes in common contents on many websites, without any limitations in editing and altering the site-individual content. Web-sites can have different structure.</li>
    <li>Quick and easy site creation for new department in new country on new domain with new language by short 1day-guide. Sites can be fully customized for national needs but have some similar texts, products and documentation. Updating such content will take effect at all sites which are using it.</li>
    <li>Django template language for content editors.</li>
    <li>Draft\publish model with history and ability to revert changes.</li>
    <li>Dashboard for controlling content editors activities.</li>
    <li>Displaying a web-page content or sub-domain content depending on the user region. Creating sub-domains for regions in one click. Region can include multiple districts. User location determination by DjangoGeoIp.</li>
    <li>Cache invalidation</li>
    <li>and many more..</li>
    </ul>
  <h3>PRODUCT DATABASE</h3>
  <ul>
    <li>Entity-Attribute-Value (EAV) product storage with django admin interface integration. Adding new attributes of different types to products and product types on the fly.</li>
    <li>Many price-fields with different currencies for one product in many regions for different customers. Price-fields can be dependent.</li>
    <li>Flexible template system for product presentation.</li>
    <li>Frequently changing data import from xlsx.</li>
  </ul>  
  <h3>DOCUMENT GENERATION</h3>
  <ul>
    <li>Complex pdf generation from odt templates and product attributes.</li>
  </ul>
