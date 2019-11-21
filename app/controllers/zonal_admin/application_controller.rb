module ZonalAdmin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin!
    before_action :authorize_admin!

    def current_user
      if session[:user_id]
        @current_user ||= User.find_by_id(session[:user_id])
      else
        @current_user = nil
      end
    end

    def authenticate_admin!
      redirect_to root_url if current_user.nil?
    end

    def authorize_admin!
      redirect_to root_url unless current_user.has_role? :zonal_admin, current_user.zone
      flash[:alert] = t("not_permitted")
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
