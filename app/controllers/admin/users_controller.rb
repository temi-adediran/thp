module Admin
  class UsersController < Admin::ApplicationController
    def valid_action?(name, resource = resource_class)
      %w[show edit].include?(name.to_s) && super
    end
  end
end
