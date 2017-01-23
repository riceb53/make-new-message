class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: 2)
  end
  helper_method :current_user

  def authenticate_user
    redirect_to '/login' unless current_user
  end


end
