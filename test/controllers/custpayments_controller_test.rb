require 'test_helper'

class CustpaymentsControllerTest < ActionController::TestCase
  setup do
    @custpayment = custpayments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:custpayments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create custpayment" do
    assert_difference('Custpayment.count') do
      post :create, custpayment: { affectedinvoice: @custpayment.affectedinvoice, createdate: @custpayment.createdate, paymentamount: @custpayment.paymentamount, paymentsource: @custpayment.paymentsource }
    end

    assert_redirected_to custpayment_path(assigns(:custpayment))
  end

  test "should show custpayment" do
    get :show, id: @custpayment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @custpayment
    assert_response :success
  end

  test "should update custpayment" do
    patch :update, id: @custpayment, custpayment: { affectedinvoice: @custpayment.affectedinvoice, createdate: @custpayment.createdate, paymentamount: @custpayment.paymentamount, paymentsource: @custpayment.paymentsource }
    assert_redirected_to custpayment_path(assigns(:custpayment))
  end

  test "should destroy custpayment" do
    assert_difference('Custpayment.count', -1) do
      delete :destroy, id: @custpayment
    end

    assert_redirected_to custpayments_path
  end
end
