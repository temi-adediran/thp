class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :profile, :edit_profile, :update_profile]
  skip_before_action :ensure_authentication, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      UserMailer.welcome_email(@user).deliver_now
      redirect_to dashboard_path
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

  def update_profile
    if @user.update(profile_params)
      flash[:notice] = t("controllers.users.update.notice")
    else
      flash[:alert] = "Profile was not saved successfully. Pls try again!"
    end
    render :edit_profile
  end

  def account_settings
    @account_settings_form = AccountSettingsForm.new(current_user, {})
  end

  def update_account
    @account_settings_form = AccountSettingsForm.new(current_user, account_settings_params)

    if @account_settings_form.save!
      flash[:notice] = "Account information updated successfully"
    else
      flash[:alert] = "Account information update was not successful. Pls ensure all fields are correct!"
    end
    render :account_settings
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
      :title,
      :first_name,
      :last_name,
      :gender,
      :date_of_birth,
      :residential_address,
      :phone_no,
      :additional_phone_no,
      :country,
      :state,
      :city,
      :home_address,
      :marital_status,
      :name_of_spouse,
      :wedding_anniversary,
      :designation,
      :zone,
      :cell,
      :chapter,
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

  def account_settings_params
    params.require(:account_settings_form).permit(
      :current_email,
      :new_email,
      :password
    )
  end
end
