require 'test_helper'

class ClientShopsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_shops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_shop" do
    assert_difference('ClientShop.count') do
      post :create, :client_shop => { }
    end

    assert_redirected_to client_shop_path(assigns(:client_shop))
  end

  test "should show client_shop" do
    get :show, :id => client_shops(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => client_shops(:one).to_param
    assert_response :success
  end

  test "should update client_shop" do
    put :update, :id => client_shops(:one).to_param, :client_shop => { }
    assert_redirected_to client_shop_path(assigns(:client_shop))
  end

  test "should destroy client_shop" do
    assert_difference('ClientShop.count', -1) do
      delete :destroy, :id => client_shops(:one).to_param
    end

    assert_redirected_to client_shops_path
  end
end
