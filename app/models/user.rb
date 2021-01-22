class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :email, uniqueness: true

  has_many :orders
end
