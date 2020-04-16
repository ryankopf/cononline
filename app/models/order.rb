class Order < ApplicationRecord

  def add_items(products,quantities)
    products.each_with_index do |product_id, i|
      Orderitem.create(order: self, product_id: product_id, quantity: quantities[i])
    end
  end
  def add_payment

  end
end
