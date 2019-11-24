module Admin
  class ZonesController < Admin::ApplicationController
    def valid_action?(name, resource = resource_class)
      %w[new edit show destroy].include?(name.to_s) && super
    end
  end
end
