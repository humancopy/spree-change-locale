module SpreeChangeLocale
  module InstanceMethods
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
  end

  module Methods
    class << self
      include InstanceMethods
    end
  end
end