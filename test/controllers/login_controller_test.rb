require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  setup do
    #@user = users(:one)
    initialize_data
  end

  test "should get login page" do
    get new_user_url
    assert_response :success
  end

  test "should log in" do
    get "/login/#{User.first.id}/#{User.first.key}"
    follow_redirect!
    assert_response :success
    assert_equal "/", path
  end

  test "should still log in but only on test" do
    get "/login/#{User.first.id}/wrongpassword"
    follow_redirect!
    assert_response :success
    assert_equal "/", path
  end
end
