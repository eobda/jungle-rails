class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true
end
