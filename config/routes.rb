Rails.application.routes.draw do
  # Add your extension routes here
  match '/:locale/(*return_path)' => 'locale#set', :constraints => {:locale => /\b#{I18n.enabled_locales.join('|')}\b/}, :as => :change_locale
end
