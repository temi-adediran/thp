module ZonalAdmin
  class ChaptersController < ZonalAdmin::ApplicationController
    def valid_action?(name, resource = resource_class)
      %w[new edit show].include?(name.to_s) && super
    end
  end
end
