module LocaleHelper
  def link_to_locale(locale, name = nil)
    link_to name || locale_name(locale), "/#{locale}#{request.path}"
  end
  def locale_name(locale)
    I18n.t :this_file_language, :locale => locale
    # 
    # t("locale.#{locale.to_s.sub('-', '_')}")
  end
end
