class User < ApplicationRecord
  before_save :normalize_email

  has_secure_password
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true
  validates :password, length: { minimum: 7 }

  def authenticate_with_credentials(email, password)
    if email.strip
      email.strip!
    else
      email
    end

    user = User.find_by(email: email.downcase)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  private

  def normalize_email
    self.email = email.downcase
  end
end
