require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "create a cart and process an order" do
    cart = nil
    assert_difference('Cart.count') do
      cart = Cart.create(user_id: User.first.id)
    end
    assert_difference('Cartproduct.count', 1) do
      cart.cartproducts.create(product_id: Product.first.id, quantity: 1)
    end
    assert_difference('Order.count',1) do
      assert_difference('Orderproduct.count',1) do
        cart.paid!({mc_gross: 100, mc_fee: 100, txn_id: 'test', payer_email: 'some@body.com', receiver_email: 'some@bodyelse.com', quantities: '1', products: "#{Product.first.id}",
                  vendor_id: Product.first.vendor_id})
      end
    end
  end
end
