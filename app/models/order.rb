class Order < ApplicationRecord
  has_many :orderproducts

  def add_items(products,quantities)
    products.each_with_index do |product_id, i|
      Orderproduct.create(order: self, product_id: product_id, quantity: quantities[i])
    end
  end
  def add_payment

  end
end
