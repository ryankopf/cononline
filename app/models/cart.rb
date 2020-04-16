class Cart < ApplicationRecord
  belongs_to :user
  has_many :cartproducts

  def add_product(product)
    #new_product = Cartproduct.find_by(cart_id: self.id, product_id: product.id).nil?
    cart_product = Cartproduct.find_or_create_by(cart_id: self.id, product_id: product.id)
    cart_product.increment!(:quantity)
  end

  def paid!(params)
    amount_paid = (params[:mc_gross].to_f*100).to_i
    paypal_fee = (0 - (params[:mc_fee].to_f*100).to_i)
    transaction_id = params[:txn_id]
    payer_email = params[:payer_email]
    receiver_email = params[:receiver_email]
    quantities = params[:quantities]
    product_ids = params[:products]
    product_ids.each_with_index do |product_id, i|
      products = self.cartproducts.find_by(product_id: product_id).decrement!(quantities[i])
      products.destroy if products.quantity <= 0
    end
    order = Order.create(user_id: self.user_id, vendor_id: params[:vendor_id])
    order.add_items(products, quantities)
    Payment.create(order_id: order, vendor_id: order.vendor_id, amount: amount_paid, method: "Paypal")
    return order
  end

end
