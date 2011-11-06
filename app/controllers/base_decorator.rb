Spree::BaseController.class_eval do
  helper :locale
  before_filter :set_locale, :if => proc { !session[:locale] }

  protected
  def set_locale
    session[:locale] = I18n.locale = (request.preferred_language_from(enabled_locales) || request.compatible_language_from(enabled_locales) || I18n.default_locale).intern
  end
end