module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin!

    def authenticate_admin!
      redirect_to root_url unless current_user.present? && authorized
    end

    def authorized
      current_user.has_role? :international_admin
    end

    def current_user
      if session[:user_id]
        @current_user ||= User.find_by_id(session[:user_id])
      else
        @current_user = nil
      end
    end
  end
end
