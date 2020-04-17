require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "create a cart and process an order" do
    assert_difference('Order.count') do
      cart = Cart.create(user_id: User.first.id)
      cart.cartproducts.create(product_id: Product.first.id, quantity: 1)
      cart.paid!({mc_gross: 100, mc_fee: 100, txn_id: 'test', payer_email: 'some@body.com', receiver_email: 'some@bodyelse.com', quantities: '1', products: "#{Product.first.id}",
                  vendor_id: Product.first.vendor_id})
    end
  end
end
