class User < ApplicationRecord
  has_secure_password
  include Store::Attributes

  validates :email, presence: true, uniqueness: true, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  }
  validates :password, length: { minimum: 6 }, if: Proc.new{|u| u.password.present? }

  store_attributes :previous_membership do
    attribute(:registered, :boolean, default: false)
    attribute(:chapter, :string)
    attribute(:cell_leader_name, :string)
    attribute(:cell_leader_phone_no, :string)
  end

  store_attributes :family do
    attribute(:spouse_in_christ_embassy, :boolean)
    attribute(:spouse_care_group, :string)
    attribute(:no_of_children, :integer)
  end

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
