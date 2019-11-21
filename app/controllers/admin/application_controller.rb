module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin!
    before_action :authorize_admin!

    def authenticate_admin!
      redirect_to root_url if current_user.nil?
    end

    def authorize_admin!
      redirect_to root_url unless current_user.has_role? :international_admin
      flash[:alert] = t("not_permitted")
    end

    # # Raise an exception if the user is not permitted to access this resource
    def authorize_resource(resource)
      raise CanCan::AccessDenied unless show_action?(params[:action], resource)
    end

    # # Hide links to actions if the user is not allowed to do them
    def show_action?(action, resource)
      # translate :show action to :read for cancan
      if ["show", :show].include?(action)
        action = :read
      end
      can? action, resource
    end

    rescue_from CanCan::AccessDenied do |_exception|
      flash[:alert] = t("not_permitted")
      redirect_to admin_root_url
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
