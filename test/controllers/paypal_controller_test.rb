require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    seed_and_login
    #@product = products(:product1)
  end

  test "should receive IPN" do
    post "/paypal/ipn/#{Vendor.first.id}/#{Product.pluck(:id).join('-')}/#{(1..Product.all.size).to_a.join('-')}", params: {txn_type: 'web_accept'}
    assert_response :success
  end
end
