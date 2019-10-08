require 'rails_helper'

RSpec.describe 'User', type: :feature do
  let!(:user) { create(:user) }

  scenario 'forgot password' do
    visit login_path
    expect(page).to have_content("Forgot password")

    click_link("Forgot password")
    expect(page).to have_current_path(forgot_password_path)

    fill_in("email", with: User.first.email)
    click_on("Reset Password")

    expect(page).to have_content "Email has been sent with password instructions"
    expect(page).to have_current_path(root_path)
  end

  scenario "it generates password token" do
  end

  scenario "it resets user password" do
  end
end
