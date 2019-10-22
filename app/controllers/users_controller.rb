class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to edit_user_path(@user)
    else
      render :new
    end
  end

  def edit
    @password_form = ChangePasswordForm.new(current_user, {})
  end

  def update
    if @user.update(user_params)
      redirect_to edit_user_path(@user), notice: t("controllers.users.update.notice")
    else
      render :edit
    end
  end

  def change_password
    @password_form = ChangePasswordForm.new(current_user, password_params)
    if @password_form.save!
      redirect_to edit_user_path(current_user), notice: t("controllers.users.change_password.notice")
    else
      render :edit, alert: t("controllers.users.change_password.alert")
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def password_params
    params.require(:change_password_form).permit(
      :original_password,
      :new_password,
      :new_password_confirmation
    )
  end
end
