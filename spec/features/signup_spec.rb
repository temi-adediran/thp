require 'rails_helper'

RSpec.describe 'User', type: :feature do
  let!(:user) { create(:user) }

  scenario "signup" do
    visit signup_path

    fill_in("Email", with: "user1@sample.com")
    fill_in("Password", with: "password")
    fill_in("Password confirmation", with: "password")
    click_on("Sign up")

    expect(User.last.email).to eq "user1@sample.com"
    expect(page).to have_content t("controllers.users.create.notice")
  end

  context "password not upto 6 characters" do
    scenario "does not create user" do
      visit signup_path

      fill_in("Email", with: "user2@sample.com")
      fill_in("Password", with: "pass")
      fill_in("Password confirmation", with: "pass")
      click_on("Sign up")

      expect(User.last.email).to_not eq "user2@sample.com"
      expect(page).to have_content "Password is too short (minimum is 6 characters)"
    end
  end

  context "invalid email format" do
    scenario "does not create user" do
      visit signup_path

      fill_in("Email", with: "user2sample.com")
      fill_in("Password", with: "password")
      fill_in("Password confirmation", with: "password")
      click_on("Sign up")

      expect(User.last.email).to_not eq "user2@sample.com"
      expect(page).to have_content "Email is invalid"
    end
  end

  context "password confirmation is not the same" do
    scenario "does not create user" do
      visit signup_path

      fill_in("Email", with: "user2sample.com")
      fill_in("Password", with: "password")
      fill_in("Password confirmation", with: "another_password")
      click_on("Sign up")

      expect(User.last.email).to_not eq "user2@sample.com"
      expect(page).to have_content "Password confirmation doesn't match Password"
    end
  end
end
