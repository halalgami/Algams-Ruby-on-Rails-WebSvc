require 'test_helper'

class UsersubnumsControllerTest < ActionController::TestCase
  setup do
    @usersubnum = usersubnums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usersubnums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usersubnum" do
    assert_difference('Usersubnum.count') do
      post :create, usersubnum: { createdate: @usersubnum.createdate, status: @usersubnum.status, subnum: @usersubnum.subnum }
    end

    assert_redirected_to usersubnum_path(assigns(:usersubnum))
  end

  test "should show usersubnum" do
    get :show, id: @usersubnum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usersubnum
    assert_response :success
  end

  test "should update usersubnum" do
    patch :update, id: @usersubnum, usersubnum: { createdate: @usersubnum.createdate, status: @usersubnum.status, subnum: @usersubnum.subnum }
    assert_redirected_to usersubnum_path(assigns(:usersubnum))
  end

  test "should destroy usersubnum" do
    assert_difference('Usersubnum.count', -1) do
      delete :destroy, id: @usersubnum
    end

    assert_redirected_to usersubnums_path
  end
end
