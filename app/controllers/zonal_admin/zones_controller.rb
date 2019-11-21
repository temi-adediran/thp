module ZonalAdmin
  class ZonesController < ZonalAdmin::ApplicationController
    def index
      redirect_to zonal_admin_zone_path(current_user.zone)
    end

    def valid_action?(name, resource = resource_class)
      %w[edit show].include?(name.to_s) && super
    end
  end
end
