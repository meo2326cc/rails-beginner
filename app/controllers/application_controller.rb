class ApplicationController < ActionController::Base

  def default_url_options
    if params[:locale] == nil
      { locale: I18n.default_locale }
    else
      { locale: I18n.locale = params[:locale] }
    end
  end

end
