class ApplicationController < ActionController::Base
  before_action :ensure_authentication
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    else
      @current_user = nil
    end
  end

  def ensure_authentication
    if current_user.nil?
      redirect_to root_path
    end
  end
end
