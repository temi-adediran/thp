class PasswordResetsController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def create
    user = User.find_by_email(params[:email])
    if user
      user.send_password_token
      redirect_to root_path, notice: "Email has been sent with password instructions"
    else
      render :new, alert: "Email address does not exist!"
    end
  end

  def edit
  end

  def update
    if  @user.password_token_invalid?
      redirect_to new_password_reset_path, alert: "Password token has expired"
    elsif @user.update_attributes!(password_params)
      redirect_to root_path, notice: "Password has been reset successfully"
    else
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
