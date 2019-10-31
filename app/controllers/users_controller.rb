class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :edit_profile]
  skip_before_action :ensure_authentication, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      UserMailer.welcome_email(@user).deliver_now
      redirect_to edit_user_path(@user)
    else
      render :new
    end
  end

  def edit
    @password_form = ChangePasswordForm.new(current_user, {})
  end

  def change_password
    @password_form = ChangePasswordForm.new(current_user, password_params)
    if @password_form.save!
      redirect_to edit_user_path(current_user), notice: t("controllers.users.change_password.notice")
    else
      render :edit, alert: t("controllers.users.change_password.alert")
    end
  end

  def profile
  end

  def edit_profile
  end

  def update
    if @user.update(profile_params)
      redirect_to dashboard_path, notice: t("controllers.users.update.notice")
    else
      render :edit
    end
  end

  def account_settings
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def profile_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :gender,
      :date_of_birth,
      :residential_address,
      :phone_no,
      :additional_phone_no,
      :email_address,
      :marital_status,
      :name_of_spouse,
      :wedding_anniversary,
      :date_born_again,
      :date_joined_christ_embassy,
      :current_local_church,
      :water_baptized,
      :date_water_baptized,
      :completed_foundation_school,
      :date_completed_foundation_school,
      family: {},
      previous_membership: {}
    )
  end

  def password_params
    params.require(:change_password_form).permit(
      :original_password,
      :new_password,
      :new_password_confirmation
    )
  end
end
