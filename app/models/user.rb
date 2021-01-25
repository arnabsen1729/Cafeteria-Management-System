class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :email, uniqueness: true

  has_many :orders

  def self.getWalkInCustomerId
    User.find_by(first_name: "Walk-In-Customer").id
  end

  def get_fullname
    "#{self.first_name} #{self.last_name}"
  end
end
