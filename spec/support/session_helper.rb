module SessionHelpers
  module Feature
    def sign_in_user(user)
      visit login_path
      fill_in "email", with: user.email
      fill_in "password", with: "password"
      click_button t("views.sessions.new.button")
    end
  end
end
