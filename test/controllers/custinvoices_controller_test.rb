require 'test_helper'

class CustinvoicesControllerTest < ActionController::TestCase
  setup do
    @custinvoice = custinvoices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:custinvoices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create custinvoice" do
    assert_difference('Custinvoice.count') do
      post :create, custinvoice: { affectedinvoice: @custinvoice.affectedinvoice, billperiod: @custinvoice.billperiod, billyear: @custinvoice.billyear, createdate: @custinvoice.createdate, invoiceamount: @custinvoice.invoiceamount, usersubnumfk: @custinvoice.usersubnumfk, usersubseqnumfk: @custinvoice.usersubseqnumfk }
    end

    assert_redirected_to custinvoice_path(assigns(:custinvoice))
  end

  test "should show custinvoice" do
    get :show, id: @custinvoice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @custinvoice
    assert_response :success
  end

  test "should update custinvoice" do
    patch :update, id: @custinvoice, custinvoice: { affectedinvoice: @custinvoice.affectedinvoice, billperiod: @custinvoice.billperiod, billyear: @custinvoice.billyear, createdate: @custinvoice.createdate, invoiceamount: @custinvoice.invoiceamount, usersubnumfk: @custinvoice.usersubnumfk, usersubseqnumfk: @custinvoice.usersubseqnumfk }
    assert_redirected_to custinvoice_path(assigns(:custinvoice))
  end

  test "should destroy custinvoice" do
    assert_difference('Custinvoice.count', -1) do
      delete :destroy, id: @custinvoice
    end

    assert_redirected_to custinvoices_path
  end
end
