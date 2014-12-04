require 'test_helper'

class CellTowersControllerTest < ActionController::TestCase
  setup do
    @cell_tower = cell_towers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cell_towers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cell_tower" do
    assert_difference('CellTower.count') do
      post :create, cell_tower: { band: @cell_tower.band, btc_cell_id: @cell_tower.btc_cell_id, cell_id: @cell_tower.cell_id, cgi: @cell_tower.cgi, eff_hsdpa_cap: @cell_tower.eff_hsdpa_cap, enhanced_uplink: @cell_tower.enhanced_uplink, latitude: @cell_tower.latitude, location_type: @cell_tower.location_type, longitude: @cell_tower.longitude, no_carriers: @cell_tower.no_carriers, node_b: @cell_tower.node_b, site: @cell_tower.site, site_name: @cell_tower.site_name }
    end

    assert_redirected_to cell_tower_path(assigns(:cell_tower))
  end

  test "should show cell_tower" do
    get :show, id: @cell_tower
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cell_tower
    assert_response :success
  end

  test "should update cell_tower" do
    patch :update, id: @cell_tower, cell_tower: { band: @cell_tower.band, btc_cell_id: @cell_tower.btc_cell_id, cell_id: @cell_tower.cell_id, cgi: @cell_tower.cgi, eff_hsdpa_cap: @cell_tower.eff_hsdpa_cap, enhanced_uplink: @cell_tower.enhanced_uplink, latitude: @cell_tower.latitude, location_type: @cell_tower.location_type, longitude: @cell_tower.longitude, no_carriers: @cell_tower.no_carriers, node_b: @cell_tower.node_b, site: @cell_tower.site, site_name: @cell_tower.site_name }
    assert_redirected_to cell_tower_path(assigns(:cell_tower))
  end

  test "should destroy cell_tower" do
    assert_difference('CellTower.count', -1) do
      delete :destroy, id: @cell_tower
    end

    assert_redirected_to cell_towers_path
  end
end
