require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { api_key: @user.api_key, email: @user.email, first_name: @user.first_name, image_url: @user.image_url, last_name: @user.last_name, middle_names: @user.middle_names, password: @user.password }
    end

    assert_response 201
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { api_key: @user.api_key, email: @user.email, first_name: @user.first_name, image_url: @user.image_url, last_name: @user.last_name, middle_names: @user.middle_names, password: @user.password }
    assert_response 204
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_response 204
  end
end
