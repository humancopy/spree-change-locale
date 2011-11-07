module I18nExtension
  def enabled_locales
    @@enabled_locales ||= (Spree::Config.get(:enabled_locales) || get_locales || I18n.available_locales || [I18n.default_locale]).collect(&:intern)
  end
  def locale_enabled?(locale)
    enabled_locales.include?(locale.intern)
  end

  private
  # inspired by: https://github.com/greendog/spree_locales_dropdown
  def get_locales
    path = Rails.root.join('config', 'locales')
    items = Dir.glob(Rails.root.join('config', 'locales', '*.yml')).collect { |filename| File.basename(filename.gsub(/\.yml$/, '')) }
    items unless items.blank?
  end
end
