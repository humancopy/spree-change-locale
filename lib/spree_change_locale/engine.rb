module SpreeChangeLocale
  class Engine < Rails::Engine
    engine_name 'spree_change_locale'

    config.autoload_paths += %W(#{config.root}/lib)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end

      Dir.glob(File.join(File.dirname(__FILE__), "../../app/overrides/*.rb")) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end

      # add locale helper to Spree::BaseController
      Spree::BaseController.class_eval do
        helper :locale
        before_filter :set_locale, :if => proc { !session[:locale] }

        protected
        def set_locale
          session[:locale] = I18n.locale = (request.preferred_language_from(enabled_locales) || request.compatible_language_from(enabled_locales) || I18n.default_locale).intern
        end
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
