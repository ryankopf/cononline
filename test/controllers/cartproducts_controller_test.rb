require 'test_helper'

class CartproductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cartproduct = cartproducts(:one)
  end

  test "should get index" do
    get cartproducts_url
    assert_response :success
  end

  test "should get new" do
    get new_cartproduct_url
    assert_response :success
  end

  test "should create cartproduct" do
    assert_difference('Cartproduct.count') do
      post cartproducts_url, params: { cartproduct: { cart_id: @cartproduct.cart_id, product_id: @cartproduct.product_id, quantity: @cartproduct.quantity } }
    end

    assert_redirected_to cartproduct_url(Cartproduct.last)
  end

  test "should show cartproduct" do
    get cartproduct_url(@cartproduct)
    assert_response :success
  end

  test "should get edit" do
    get edit_cartproduct_url(@cartproduct)
    assert_response :success
  end

  test "should update cartproduct" do
    patch cartproduct_url(@cartproduct), params: { cartproduct: { cart_id: @cartproduct.cart_id, product_id: @cartproduct.product_id, quantity: @cartproduct.quantity } }
    assert_redirected_to cartproduct_url(@cartproduct)
  end

  test "should destroy cartproduct" do
    assert_difference('Cartproduct.count', -1) do
      delete cartproduct_url(@cartproduct)
    end

    assert_redirected_to cartproducts_url
  end
end
