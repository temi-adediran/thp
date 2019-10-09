class ChangePasswordForm
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :original_password, :new_password, :new_password_confirmation

  validates :new_password, length: { minimum: 6 }, confirmation: true
  validates :original_password, :new_password, :new_password_confirmation, presence: true
  validate :verify_original_password

  def initialize(user, attrs)
    @user = user
    super(attrs)
  end

  def save!
    return unless valid?

    @user.password = new_password
    @user.save!
    true
  end

  private

  def verify_original_password
    unless @user.authenticate(original_password)
      errors.add :original_password, "is not correct"
    end
  end
end
