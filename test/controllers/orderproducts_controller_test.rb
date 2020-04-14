require 'test_helper'

class OrderproductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @orderproduct = orderproducts(:one)
  end

  test "should get index" do
    get orderproducts_url
    assert_response :success
  end

  test "should get new" do
    get new_orderproduct_url
    assert_response :success
  end

  test "should create orderproduct" do
    assert_difference('Orderproduct.count') do
      post orderproducts_url, params: { orderproduct: { order_id: @orderproduct.order_id, price: @orderproduct.price, quantity: @orderproduct.quantity, status: @orderproduct.status } }
    end

    assert_redirected_to orderproduct_url(Orderproduct.last)
  end

  test "should show orderproduct" do
    get orderproduct_url(@orderproduct)
    assert_response :success
  end

  test "should get edit" do
    get edit_orderproduct_url(@orderproduct)
    assert_response :success
  end

  test "should update orderproduct" do
    patch orderproduct_url(@orderproduct), params: { orderproduct: { order_id: @orderproduct.order_id, price: @orderproduct.price, quantity: @orderproduct.quantity, status: @orderproduct.status } }
    assert_redirected_to orderproduct_url(@orderproduct)
  end

  test "should destroy orderproduct" do
    assert_difference('Orderproduct.count', -1) do
      delete orderproduct_url(@orderproduct)
    end

    assert_redirected_to orderproducts_url
  end
end
