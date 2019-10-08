require 'rails_helper'

RSpec.describe 'User', type: :feature do
  let(:user) { create(:user) }

  scenario 'change password' do
    sign_in_user(user)
    expect(page).to have_content("Change password")

    click_link("Change password")
    expect(page).to have_current_path(edit_user_path(user))

    fill_in("Old password", with: user.password)
    fill_in("New password", with: "password")
    fill_in("Confirm new password", with: "password")
    click_on("Update password")

    expect(page).to have_current_path(root_path)
    expect(page).to have_content("Password was updated successfully")
  end
end
