Spree::BaseController.class_eval do
  before_filter :set_locale, :if => proc { !session[:locale] }

  protected
  def set_locale
    session[:locale] = I18n.locale = (request.preferred_language_from(I18n.enabled_locales) || request.compatible_language_from(I18n.enabled_locales) || I18n.default_locale).to_sym
  end
end