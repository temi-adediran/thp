class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  # validates_length_of :password, minimum: 6

  def send_password_token
    self.password_reset_token = generate_token
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver_now
  end

  def password_token_invalid?
    self.password_reset_sent_at < 6.hours.ago
  end

  private

  def generate_token
    SecureRandom.urlsafe_base64
  end
end
