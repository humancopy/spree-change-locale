Spree::BaseController.class_eval do
  include SpreeChangeLocale::Controller
  helper :local
end