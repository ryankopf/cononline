class Product < ApplicationRecord
  belongs_to :vendor
  #belongs_to :user, through: :vendor
  has_one_attached :image
  include HasPrice
  before_save :update_price

  # Validations.
  validates :name, length: { minimum: 3 }
  validates :about, length: { maximum: 250 }

end
