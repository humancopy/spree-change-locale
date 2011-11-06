SpreeChangeLocale
=================

Easy locale change in Spree.


Example
=======

Adds a locale controller and route so then the any page can be appended with the locale as a path.

The extension saves the locale in __session[:locale]__ and redirects back to the requested page, omitting the locale path addition.

Examples:
  /es/cart => /cart in Spanish
  /fr/account => /account in French
  /ru => / in Russian.

You can do the following in a view to generate a list linkable enabled locales:
```
<ul>
<% enabled_locales.each do |locale| %>
  <%= content_tag :li, link_to_locale(locale), :class => locale == session[:locale] ? 'selected' : nil %>
<% end %>
</ul>
```

You can setup **Spree::Config.get(:enabled_locales)** with an array of available locales. Otherwise only **I18n.locale** will be considered enabled.

Testing
-------

Be sure to add the rspec-rails gem to your Gemfile and then create a dummy test app for the specs to run against.

    $ bundle exec rake test app
    $ bundle exec rspec spec

Copyright (c) 2011 [name of extension creator], released under the New BSD License
