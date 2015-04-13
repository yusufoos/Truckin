require 'test_helper'

class FoodTrucksControllerTest < ActionController::TestCase
  setup do
    @food_truck = food_trucks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_trucks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create food_truck" do
    assert_difference('FoodTruck.count') do
      post :create, food_truck: { latitude: @food_truck.latitude, longitude: @food_truck.longitude, merchantUserEmail: @food_truck.merchantUserEmail, name: @food_truck.name, user_id: @food_truck.user_id }
    end

    assert_redirected_to food_truck_path(assigns(:food_truck))
  end

  test "should show food_truck" do
    get :show, id: @food_truck
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @food_truck
    assert_response :success
  end

  test "should update food_truck" do
    patch :update, id: @food_truck, food_truck: { latitude: @food_truck.latitude, longitude: @food_truck.longitude, merchantUserEmail: @food_truck.merchantUserEmail, name: @food_truck.name, user_id: @food_truck.user_id }
    assert_redirected_to food_truck_path(assigns(:food_truck))
  end

  test "should destroy food_truck" do
    assert_difference('FoodTruck.count', -1) do
      delete :destroy, id: @food_truck
    end

    assert_redirected_to food_trucks_path
  end
end
