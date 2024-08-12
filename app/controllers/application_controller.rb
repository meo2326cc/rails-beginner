class ApplicationController < ActionController::Base

before_action :set_locale

  def set_locale
    if I18n.available_locales.include?(params[:locale]&.to_sym)
      I18n.locale = params[:locale]
      session[:current_locale] = params[:locale]
    elsif session[:current_locale]
      I18n.locale = session[:current_locale] 
    end
  end

end
