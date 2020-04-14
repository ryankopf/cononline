require "application_system_test_case"

class CartproductsTest < ApplicationSystemTestCase
  setup do
    @cartproduct = cartproducts(:one)
  end

  test "visiting the index" do
    visit cartproducts_url
    assert_selector "h1", text: "Cartproducts"
  end

  test "creating a Cartproduct" do
    visit cartproducts_url
    click_on "New Cartproduct"

    fill_in "Cart", with: @cartproduct.cart_id
    fill_in "Product", with: @cartproduct.product_id
    fill_in "Quantity", with: @cartproduct.quantity
    click_on "Create Cartproduct"

    assert_text "Cartproduct was successfully created"
    click_on "Back"
  end

  test "updating a Cartproduct" do
    visit cartproducts_url
    click_on "Edit", match: :first

    fill_in "Cart", with: @cartproduct.cart_id
    fill_in "Product", with: @cartproduct.product_id
    fill_in "Quantity", with: @cartproduct.quantity
    click_on "Update Cartproduct"

    assert_text "Cartproduct was successfully updated"
    click_on "Back"
  end

  test "destroying a Cartproduct" do
    visit cartproducts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cartproduct was successfully destroyed"
  end
end
