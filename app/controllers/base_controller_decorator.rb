Spree::BaseController.class_eval do
  helper_method :enabled_locales
  before_filter :set_locale, :if => proc { !session[:locale] }

  protected
  def enabled_locales
    @enabled_locales ||= (Spree::Config.get(:enabled_locales) || get_locales || I18n.available_locales || [I18n.default_locale]).collect(&:intern)
  end

  # inspired by: https://github.com/greendog/spree_locales_dropdown
  def get_locales
     path = Rails.root.join('config', 'locales')
     items = Dir.glob(Rails.root.join('config', 'locales', '*.yml')).collect { |filename| File.basename(filename.gsub(/\.yml$/, '')) }
     items unless items.blank?
     # Dir.glob(Rails.root.join('config', 'locales', '*.yml')).inject([]) do |mem, filename|
     #   locale_file = YAML.load_file(path.join(filename))
     #   str = File.basename(filename.gsub(/\.yml$/, ''))
     #   str = str.gsub("_spree", "")
     #   mem << str if locale_file.has_key?(str)
     # 
     #   mem
     # end
   end
  
  def set_locale
    session[:locale] = I18n.locale = (request.preferred_language_from(enabled_locales) || request.compatible_language_from(enabled_locales) || I18n.default_locale).intern
  end
end