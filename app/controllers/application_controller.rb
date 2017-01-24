class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= Girl.find_by(id: 2)
  end
  helper_method :current_user
  def current_type
    current_user.class
  end
  helper_method :current_type

  def authenticate_user
    redirect_to '/login' unless current_user
  end


end
