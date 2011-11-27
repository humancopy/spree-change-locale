class LocaleController < Spree::BaseController
  def set
    session[:locale] = I18n.locale = params[:locale].to_sym if params[:locale] && I18n.available_locales.include?(params[:locale].to_sym)
    redirect_back_or_default(params[:return_path] ? "/#{params[:return_path]}" : root_path)
  end
end
