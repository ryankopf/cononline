require "application_system_test_case"

class OrderproductsTest < ApplicationSystemTestCase
  setup do
    @orderproduct = orderproducts(:one)
  end

  test "visiting the index" do
    visit orderproducts_url
    assert_selector "h1", text: "Orderproducts"
  end

  test "creating a Orderproduct" do
    visit orderproducts_url
    click_on "New Orderproduct"

    fill_in "Order", with: @orderproduct.order_id
    fill_in "Price", with: @orderproduct.price
    fill_in "Quantity", with: @orderproduct.quantity
    fill_in "Status", with: @orderproduct.status
    click_on "Create Orderproduct"

    assert_text "Orderproduct was successfully created"
    click_on "Back"
  end

  test "updating a Orderproduct" do
    visit orderproducts_url
    click_on "Edit", match: :first

    fill_in "Order", with: @orderproduct.order_id
    fill_in "Price", with: @orderproduct.price
    fill_in "Quantity", with: @orderproduct.quantity
    fill_in "Status", with: @orderproduct.status
    click_on "Update Orderproduct"

    assert_text "Orderproduct was successfully updated"
    click_on "Back"
  end

  test "destroying a Orderproduct" do
    visit orderproducts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Orderproduct was successfully destroyed"
  end
end
