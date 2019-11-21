class UserPresenter < ApplicationPresenter
  def user_zone
    user.zone.present? ? "Zone #{user.zone.name}" : "<your zone>"
  end

  def user
    model
  end
end
