class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter  :set_locale

  def set_locale
    locale = params[:locale]

    I18n.locale = locale
    puts "Locale used: #{locale}"
  end

end
