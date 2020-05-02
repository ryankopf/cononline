class Order < ApplicationRecord
  belongs_to :cart, required: false
  belongs_to :user, required: false
  belongs_to :vendor
  has_many :orderproducts
  has_many :payments

  def add_items(product_ids,quantities)
    product_ids.each_with_index do |product_id, i|
      Orderproduct.create(order: self, product_id: product_id, quantity: quantities[i].to_i, price: Product.find(product_id), status: 'New')
    end
  end
  def add_payment

  end
end
