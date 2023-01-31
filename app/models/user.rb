class User < ApplicationRecord

  has_secure_password

  before_save :downcase_email

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true

  def downcase_email
    self.email = email.downcase
  end

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email email
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

end
