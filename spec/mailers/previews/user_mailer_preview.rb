class UserMailerPreview < ActionMailer::Preview
  def password_reset
    UserMailer.password_reset(User.last)
  end

  def welcome_email
    UserMailer.welcome_email(User.last)
  end
end
