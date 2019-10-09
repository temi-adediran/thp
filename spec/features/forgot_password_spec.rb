require 'rails_helper'

RSpec.describe 'User', type: :feature do
  let!(:user) { create(:user) }

  scenario 'forgot password' do
    visit login_path
    expect(page).to have_content("Forgot password")

    click_link("Forgot password")
    expect(page).to have_current_path(forgot_password_path)

    fill_in("email", with: user.email)

    click_on("Reset Password")

    expect(page).to have_content t("controllers.password_reset.create.notice")
    expect(page).to have_current_path(root_path)
    expect(user.reload.password_reset_token).to be_present
    expect(user.reload.password_reset_sent_at).to be_present
    # test email is sent
  end

  scenario "it resets user password" do
    request_password_token
    visit edit_password_reset_path(id: user.reload.password_reset_token)
    fill_in("New password", with: "password")
    fill_in("Confirm new password", with: "password")
    click_on("Update password")

    expect(page).to have_content t("controllers.password_reset.update.notice")
  end

  context "token has expired" do
    scenario "it does not update password" do
      request_password_token

      travel 1.day do
        visit edit_password_reset_path(id: user.reload.password_reset_token)
        fill_in("New password", with: "password")
        fill_in("Confirm new password", with: "password")
        click_on("Update password")
      end
      expect(page).to have_content t("controllers.password_reset.update.alert_expired")
      expect(page).to have_current_path(new_password_reset_path)

      travel_back
    end
  end

  def request_password_token
    visit forgot_password_path
    fill_in("email", with: user.email)
    click_on("Reset Password")
  end
end
