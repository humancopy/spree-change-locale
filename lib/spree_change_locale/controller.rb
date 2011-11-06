module SpreeChangeLocale
  module Controller
    def self.included(base)
      base.class_eval do
        include LocaleHelper
        include InstanceMethods
        before_filter :set_locale, :if => proc { !session[:locale] }
      end
    end

    module InstanceMethods
      protected
      def set_locale
        session[:locale] = I18n.locale = (request.preferred_language_from(enabled_locales) || request.compatible_language_from(enabled_locales) || I18n.default_locale).intern
      end

      # private
      # def extract_locale_from_accept_language_header
      #   request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
      # end
    end
  end
end