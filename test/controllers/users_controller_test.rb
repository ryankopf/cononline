require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    seed_and_login
    @user = users(:user1)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: "#{rand(500)}#{@user.email}", key: @user.key, key_made_at: @user.key_made_at, token: @user.token, token_made_at: @user.token_made_at } }
    end

    assert_redirected_to '/pending'
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    #patch user_url(@user), params: { user: { email: @user.email, key: @user.key, key_made_at: @user.key_made_at, token: @user.token, token_made_at: @user.token_made_at } }
    #assert_redirected_to user_url(@user)
  end

  test "should not destroy user" do
    assert_difference('User.count', 0) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
