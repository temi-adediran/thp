module ZonalAdmin
  class UsersController < ZonalAdmin::ApplicationController
    def valid_action?(name, resource = resource_class)
      %w[edit show].include?(name.to_s) && super
    end
  end
end
