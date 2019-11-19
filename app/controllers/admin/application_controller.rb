module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin

    def authenticate_admin
    #   redirect_to root_path if current_user.nil?
    end

    # # Limit the scope of the given resource
    # def scoped_resource
    #   super.where(user: current_user)
    # end

    # # Raise an exception if the user is not permitted to access this resource
    # def authorize_resource(resource)
    #   raise "You're not permitted to view this page!" unless show_action?(params[:action], resource)
    # end

    # # Hide links to actions if the user is not allowed to do them
    # def show_action?(action, resource)
    #   current_user.can? action, resource
    # end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
