class Order < ApplicationRecord
  has_many :orderproducts
  has_many :payments

  def add_items(products,quantities)
    products.each_with_index do |product_id, i|
      Orderproduct.create(order: self, product_id: product_id, quantity: quantities[i].to_i)
    end
  end
  def add_payment

  end
end
