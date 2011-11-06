Rails.application.routes.draw do
  # Add your extension routes here
  match '/:locale/(*return_path)' => 'locale#set', :constraints => {:locale => /\b#{Spree::Config.get(:enabled_locales)}\b/}, :as => :change_locale
end
