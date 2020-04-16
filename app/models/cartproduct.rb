class Cartproduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product
end
