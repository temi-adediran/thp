require 'rails_helper'

RSpec.describe 'User', type: :feature do
  let!(:user) { create(:user) }

  scenario "signup" do
    visit signup_path

    fill_in("Email address", with: "user1@sample.com")
    fill_in("Password", with: "password")
    fill_in("Confirm password", with: "password")
    click_on(t("views.users.new.button"))

    expect(User.last.email).to eq "user1@sample.com"
    expect(page).to have_content "Logged in as user1@sample.com"
  end

  context "password not upto 6 characters" do
    scenario "does not create user" do
      visit signup_path

      fill_in("Email address", with: "user2@sample.com")
      fill_in("Password", with: "pass")
      fill_in("Confirm password", with: "pass")
      click_on(t("views.users.new.button"))

      expect(User.last.email).to_not eq "user2@sample.com"
      expect(page).to have_content "Password is too short (minimum is 6 characters)"
    end
  end

  context "invalid email format" do
    scenario "does not create user" do
      visit signup_path

      fill_in("Email address", with: "user2sample.com")
      fill_in("Password", with: "password")
      fill_in("Confirm password", with: "password")
      click_on(t("views.users.new.button"))

      expect(User.last.email).to_not eq "user2@sample.com"
      expect(page).to have_content "Email is invalid"
    end
  end

  context "Confirm password is not the same" do
    scenario "does not create user" do
      visit signup_path

      fill_in("Email address", with: "user2sample.com")
      fill_in("Password", with: "password")
      fill_in("Confirm password", with: "another_password")
      click_on(t("views.users.new.button"))

      expect(User.last.email).to_not eq "user2@sample.com"
      expect(page).to have_content "Password confirmation doesn't match Password"
    end
  end
end
