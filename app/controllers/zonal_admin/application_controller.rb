module ZonalAdmin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin!

    def authenticate_admin!
      redirect_to root_path unless current_user && authorized
    end

    def authorized
      current_user.has_role? :zonal_admin, current_user.zone
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end

    def current_user
      if session[:user_id]
        @current_user ||= User.find_by_id(session[:user_id])
      else
        @current_user = nil
      end
    end
  end
end
