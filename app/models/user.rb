class User < ApplicationRecord
  has_secure_password
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true
  validates :password, length: { minimum: 7 }

  def self.authenticate_with_credentials(email, password) do
    user = User.find_by(email: email)
    if user.authenticate(password)
      user
    else
      nil
    end
  end
end
