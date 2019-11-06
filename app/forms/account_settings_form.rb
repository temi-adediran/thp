class AccountSettingsForm
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :current_email, :new_email, :password

  validates :new_email, presence: true, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  }
  validates :current_email, :password, presence: true
  validate :verify_current_email
  validate :verify_password

  def initialize(user, attrs)
    @user = user
    super(attrs)
  end

  def save!
    return unless valid?

    @user.email = new_email
    @user.save!
    true
  end

  private

  def verify_current_email
    unless current_email == @user.email
      errors.add :current_email, "is not correct"
    end
  end

  def verify_password
    unless @user.authenticate(password)
      errors.add :password, "is not correct"
    end
  end
end
