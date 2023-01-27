class User < ApplicationRecord

  has_secure_password

  before_save :downcase_email

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true

  def downcase_email
    self.email = email.downcase
  end

end
