class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale
  before_filter :authenticate_user!
  before_filter :check_session

  def set_locale
    locale = params[:locale]

    I18n.locale = locale
    puts "Locale used: #{locale}"
  end

  def logout
    puts 'Logged out!'
  end

  def check_session
    available_for_students = [:groups,:lectures,:students,:teachers,:subjects]
    action = :manage
    puts params[:action]
    available_for_students.each do |x|
      if(params[:action] == action)
        flash[:warning] = 'You are not authorized.'
        redirect_to '/'
        break
      end
    end

  end
end
