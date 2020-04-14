class Product < ApplicationRecord
  belongs_to :vendor
  #belongs_to :user, through: :vendor
  has_one_attached :image
  include HasPrice
  before_save :update_price
  validates :description, length: { maximum: 3 }

end
