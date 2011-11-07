##Spree Change Locale

[![Build Status](https://secure.travis-ci.org/humancopy/spree-change-locale.png)](http://travis-ci.org/humancopy/spree-change-locale)

Easy locale change in Spree.

##Install

Add the following to your Gemfile

    gem 'spree_change_locale'

Or if you want to use edge:
    gem 'spree_change_locale', :git => 'git://github.com/humancopy/spree-change-locale.git'

Run:

    bundle install

##Example

Adds a locale controller and route so then any path can be prepended with the locale.

The extension saves the locale in *session[:locale]* and redirects back to the requested page, omitting the locale from the path.

Examples:

* /es/cart => /cart in Spanish
* /fr/account => /account in French
* /ru => / in Russian.

Look at [examples/_language_bar.html.erb](https://github.com/humancopy/spree-change-locale/blob/master/examples/_language_bar.html.erb) for a simple use in views.

By default the extension will look at config/locales for enabled locales. If none found, it will fall to *I18n.available_locales* and then to single *I18n.default_locale*.

You can setup *Spree::Config[:enabled_locales]* with an array of available locales to force a list of enabled locales. (e.g. ```Spree::Config.set(:enabled_locales, ['en','es','it'])```)

<!-- ## Testing

Be sure to add the rspec-rails gem to your Gemfile and then create a dummy test app for the specs to run against.

    $ bundle exec rake test app
    $ bundle exec rspec spec -->

Copyright (c) 2011 humancopy.net, released under the New BSD License
