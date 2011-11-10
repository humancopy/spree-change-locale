module LocaleHelper
  # mirror I18n extension
  def enabled_locales; I18n.enabled_locales end
  def locale_enabled?(locale); I18n.locale_enabled?(locale) end

  def current_locale
    session[:locale]
  end
  def current_locale?(locale)
    locale == current_locale
  end
  def link_to_locale(locale, name = nil, *args)
    link_to name || locale_name(locale), "/#{locale}#{request && request.path}", *args if locale_enabled?(locale)
  end
  def locale_name(locale)
    I18n.t(:this_file_language, :locale => locale) if locale_enabled?(locale)
  end
end
