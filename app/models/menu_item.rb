class MenuItem < ApplicationRecord
  belongs_to :menu
  has_one_attached :image, :dependent => :destroy
end
