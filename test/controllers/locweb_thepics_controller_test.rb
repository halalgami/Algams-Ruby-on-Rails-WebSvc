require 'test_helper'

class LocwebThepicsControllerTest < ActionController::TestCase
  setup do
    @locweb_thepic = locweb_thepics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locweb_thepics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create locweb_thepic" do
    assert_difference('LocwebThepic.count') do
      post :create, locweb_thepic: { pic_coords: @locweb_thepic.pic_coords, pic_image_path: @locweb_thepic.pic_image_path, pic_link: @locweb_thepic.pic_link, pic_location_name: @locweb_thepic.pic_location_name, pic_name: @locweb_thepic.pic_name, pic_status: @locweb_thepic.pic_status, pic_timestamp: @locweb_thepic.pic_timestamp, pic_weather_currently: @locweb_thepic.pic_weather_currently, posted_by: @locweb_thepic.posted_by }
    end

    assert_redirected_to locweb_thepic_path(assigns(:locweb_thepic))
  end

  test "should show locweb_thepic" do
    get :show, id: @locweb_thepic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @locweb_thepic
    assert_response :success
  end

  test "should update locweb_thepic" do
    patch :update, id: @locweb_thepic, locweb_thepic: { pic_coords: @locweb_thepic.pic_coords, pic_image_path: @locweb_thepic.pic_image_path, pic_link: @locweb_thepic.pic_link, pic_location_name: @locweb_thepic.pic_location_name, pic_name: @locweb_thepic.pic_name, pic_status: @locweb_thepic.pic_status, pic_timestamp: @locweb_thepic.pic_timestamp, pic_weather_currently: @locweb_thepic.pic_weather_currently, posted_by: @locweb_thepic.posted_by }
    assert_redirected_to locweb_thepic_path(assigns(:locweb_thepic))
  end

  test "should destroy locweb_thepic" do
    assert_difference('LocwebThepic.count', -1) do
      delete :destroy, id: @locweb_thepic
    end

    assert_redirected_to locweb_thepics_path
  end
end
