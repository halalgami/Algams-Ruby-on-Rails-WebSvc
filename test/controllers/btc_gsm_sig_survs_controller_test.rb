require 'test_helper'

class BtcGsmSigSurvsControllerTest < ActionController::TestCase
  setup do
    @btc_gsm_sig_surv = btc_gsm_sig_survs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:btc_gsm_sig_survs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create btc_gsm_sig_surv" do
    assert_difference('BtcGsmSigSurv.count') do
      post :create, btc_gsm_sig_surv: { audit_change_date: @btc_gsm_sig_surv.audit_change_date, audit_create_date: @btc_gsm_sig_surv.audit_create_date, pic_timestamp: @btc_gsm_sig_surv.pic_timestamp, sig_lat: @btc_gsm_sig_surv.sig_lat, sig_longa: @btc_gsm_sig_surv.sig_longa, sig_str: @btc_gsm_sig_surv.sig_str, user_id: @btc_gsm_sig_surv.user_id, userinfo: @btc_gsm_sig_surv.userinfo }
    end

    assert_redirected_to btc_gsm_sig_surv_path(assigns(:btc_gsm_sig_surv))
  end

  test "should show btc_gsm_sig_surv" do
    get :show, id: @btc_gsm_sig_surv
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @btc_gsm_sig_surv
    assert_response :success
  end

  test "should update btc_gsm_sig_surv" do
    patch :update, id: @btc_gsm_sig_surv, btc_gsm_sig_surv: { audit_change_date: @btc_gsm_sig_surv.audit_change_date, audit_create_date: @btc_gsm_sig_surv.audit_create_date, pic_timestamp: @btc_gsm_sig_surv.pic_timestamp, sig_lat: @btc_gsm_sig_surv.sig_lat, sig_longa: @btc_gsm_sig_surv.sig_longa, sig_str: @btc_gsm_sig_surv.sig_str, user_id: @btc_gsm_sig_surv.user_id, userinfo: @btc_gsm_sig_surv.userinfo }
    assert_redirected_to btc_gsm_sig_surv_path(assigns(:btc_gsm_sig_surv))
  end

  test "should destroy btc_gsm_sig_surv" do
    assert_difference('BtcGsmSigSurv.count', -1) do
      delete :destroy, id: @btc_gsm_sig_surv
    end

    assert_redirected_to btc_gsm_sig_survs_path
  end
end
