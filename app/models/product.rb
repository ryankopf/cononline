class Product < ApplicationRecord
  belongs_to :vendor
  #belongs_to :user, through: :vendor
  has_one_attached :image
end
