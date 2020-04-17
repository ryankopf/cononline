class Cart < ApplicationRecord
  belongs_to :user
  has_many :cartproducts

  def add_product(product)
    #new_product = Cartproduct.find_by(cart_id: self.id, product_id: product.id).nil?
    cart_product = Cartproduct.find_or_create_by(cart_id: self.id, product_id: product.id)
    cart_product.increment!(:quantity)
  end

  def remove_product(product_id,quantity)
    cart_product = Cartproduct.find_or_create_by(cart_id: self.id, product_id: product_id)
    cart_product.decrement!(quantity)
    cart_product.destroy if quantity <= 0
  end

  def paid!(params)
    amount_paid = (params[:mc_gross].to_f*100).to_i
    paypal_fee = (0 - (params[:mc_fee].to_f*100).to_i)
    transaction_id = params[:txn_id]
    payer_email = params[:payer_email]
    receiver_email = params[:receiver_email]
    quantities = params[:quantities].split('-')
    product_ids = params[:products].split('-')
    product_ids.each_with_index do |product_id, i|
      remove_product(product_id, quantities[i].to_i)
    end
    order = Order.create(user_id: self.user_id, vendor_id: params[:vendor_id])
    order.add_items(products, quantities)
    Payment.create(order_id: order, vendor_id: order.vendor_id, amount: amount_paid, method: "Paypal")
    return order
  end

  def absorb_other_cart(old_session_cart)
    old_session_cart.cartproducts.each do |c|
      c.update_attribute(:cart_id,self.id)
    end
  end

end
