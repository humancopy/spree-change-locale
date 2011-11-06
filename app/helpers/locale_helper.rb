module LocaleHelper
  def enabled_locales
    @enabled_locales ||= (Spree::Config.get(:enabled_locales) || I18n.locale).split('|').collect(&:intern)
  end
  def link_to_locale(locale, name = nil)
    link_to name || locale_name(locale), "/#{locale}#{request.path}"
  end
  def locale_name(locale)
    t("locale.#{locale.to_s.sub('-', '_')}")
  end
end
