class PasswordResetsController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user.present?
      user.send_password_token!
      flash[:notice] = t("controllers.password_reset.create.notice")
    else
      flash.now[:alert] = t("controllers.password_reset.create.alert")
    end
    render :new
  end

  def edit
  end

  def update
    if  @user.password_token_invalid?
      redirect_to new_password_reset_path, alert: t("controllers.password_reset.update.alert_expired")
    elsif @user.update_attributes!(password_params)
      redirect_to edit_user_path(@user), notice: t("controllers.password_reset.update.notice")
    else
      flash.now[:alert] = t("controllers.password_reset.update.alert")
      render :edit
    end
  end

  private

  def set_user
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
