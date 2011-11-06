module LocaleHelper
  def enabled_locales
    @enabled_locales ||= (Spree::Config.get(:enabled_locales) || get_locales || I18n.default_locale).split('|').collect(&:intern)
  end
  def link_to_locale(locale, name = nil)
    link_to name || locale_name(locale), "/#{locale}#{request.path}"
  end
  def locale_name(locale)
    t("locale.#{locale.to_s.sub('-', '_')}")
  end

  # inspired by: https://github.com/greendog/spree_locales_dropdown
  def get_locales
     path = Rails.root.join('config', 'locales')
     Dir.glob(Rails.root.join('config', 'locales', '*.yml')).collect { |filename| File.basename(filename.gsub(/\.yml$/, '')) }

     # Dir.glob(Rails.root.join('config', 'locales', '*.yml')).inject([]) do |mem, filename|
     #   locale_file = YAML.load_file(path.join(filename))
     #   str = File.basename(filename.gsub(/\.yml$/, ''))
     #   str = str.gsub("_spree", "")
     #   mem << str if locale_file.has_key?(str)
     # 
     #   mem
     # end
   end
end
