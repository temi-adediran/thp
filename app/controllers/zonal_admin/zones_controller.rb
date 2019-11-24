module ZonalAdmin

  class ZonesController < ZonalAdmin::ApplicationController
    def show
      return redirect_to zonal_admin_root_path unless requested_resource == current_user.zone

      render locals: {
        page: Administrate::Page::Show.new(dashboard, requested_resource),
      }
    end

    def valid_action?(name, resource = resource_class)
      %w[edit show].include?(name.to_s) && super
    end
  end
end
