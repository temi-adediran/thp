class UserMailer < ApplicationMailer
  def password_reset(user)
    @user = user
    mail(to: @user.email, subject: t("mailers.user_mailer.password_reset.subject"))
  end
end
