Spree::BaseController.class_eval do
  include SpreeChangeLocale::Controller
  helper :locale
end