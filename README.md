Spree Change Locale
=================

Easy locale change in Spree.


Example
=======

Adds a locale controller and route so then any path can be prepended with the locale.

The extension saves the locale in *session[:locale]* and redirects back to the requested page, omitting the locale from the path.

Examples:

* /es/cart => /cart in Spanish
* /fr/account => /account in French
* /ru => / in Russian.

Look at [examples/_language_bar.html.erb](blob/master/examples/_language_bar.html.erb) for a simple use in views.

You can setup *Spree::Config.get(:enabled_locales)* with an array of available locales. Otherwise only *I18n.locale* will be considered enabled.

<!-- Testing
-------

Be sure to add the rspec-rails gem to your Gemfile and then create a dummy test app for the specs to run against.

    $ bundle exec rake test app
    $ bundle exec rspec spec -->

Copyright (c) 2011 [name of extension creator], released under the New BSD License
