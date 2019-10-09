require 'rails_helper'

RSpec.describe 'User', type: :feature do
  let!(:user) { create(:user) }


  scenario 'log in' do
    visit login_path
    fill_in("Email", with: user.email)
    fill_in("Password", with: user.password)
    click_on("Login")

    expect(page).to have_content(t("controllers.sessions.create.notice"))
    expect(page).to have_content("Logged in as #{user.email}")
  end

  context "invalid email or password" do
    scenario "log in" do
      visit login_path
      fill_in("Email", with: user.email)
      fill_in("Password", with: "Invalid_password")
      click_on("Login")

      expect(page).to have_content(t("controllers.sessions.create.alert"))
      expect(page).to_not have_content("Logged in as #{user.email}")
    end
  end

  scenario "log out" do
    sign_in_user(user)
    visit root_path
    click_link("Log Out")
    expect(page).to have_content("Log In")
  end
end
