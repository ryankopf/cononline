class Vendor < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :products, dependent: :destroy

end
