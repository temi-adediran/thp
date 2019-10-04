class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, if: Proc.new{|u| u.password.present? }

  def password_token_invalid?
    self.password_reset_sent_at < 6.hours.ago
  end

  def send_password_token!
    self.password_reset_token = generate_token
    self.password_reset_sent_at = Time.zone.now
    save!
    send_password_reset_mail
  end

  def generate_token
    SecureRandom.urlsafe_base64
  end

  def send_password_reset_mail
    UserMailer.password_reset(self).deliver_now
  end
end
