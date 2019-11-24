module ZonalAdmin
  class UsersController < ZonalAdmin::ApplicationController
    def update
      role = params[:user][:roles]
      user = User.find(params[:id])

      if role == "chapter_admin"
        user.add_role :chapter_admin, user.chapter
        flash[:notice] = "#{user.name} has been made a chapter admin of #{user.chapter.name}"
      elsif role == "zonal_admin"
        user.add_role :zonal_admin, user.zone
        flash[:notice] = "#{user.name} has been made a zonal admin of #{user.zone.name}"
      end
      redirect_to zonal_admin_user_path(user)
    end

    def valid_action?(name, resource = resource_class)
      %w[edit show].include?(name.to_s) && super
    end
  end
end
