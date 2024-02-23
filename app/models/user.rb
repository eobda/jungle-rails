class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :password, confirmation: true
end
