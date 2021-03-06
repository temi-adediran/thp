require 'rails_helper'

RSpec.describe 'User', type: :feature do
  let!(:user) { create(:user) }


  scenario 'log in' do
    visit login_path
    fill_in(t("views.sessions.new.email"), with: user.email)
    fill_in("Password", with: user.password)
    click_on(t("views.sessions.new.button"))

    expect(page).to have_content("Logged in as #{user.email}")
  end

  context "invalid email or password" do
    scenario "log in" do
      visit login_path
      fill_in(t("views.sessions.new.email"), with: user.email)
      fill_in("Password", with: "Invalid_password")
      click_on(t("views.sessions.new.button"))

      expect(page).to_not have_content("Logged in as #{user.email}")
    end
  end

  scenario "log out" do
    sign_in_user(user)
    click_link("Log Out")
    expect(page).to have_content("LOG IN")
  end
end
