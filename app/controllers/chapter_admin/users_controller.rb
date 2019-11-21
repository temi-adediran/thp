module ChapterAdmin
  class UsersController < ChapterAdmin::ApplicationController

    def valid_action?(name, resource = resource_class)
      %w[show].include?(name.to_s) && super
    end
  end
end
