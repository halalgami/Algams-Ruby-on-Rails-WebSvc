json.array!(@cell_towers) do |cell_tower|
  json.extract! cell_tower, :id, :cgi, :cell_id, :site_name, :site, :latitude, :longitude, :btc_cell_id, :location_type, :node_b, :no_carriers, :eff_hsdpa_cap, :enhanced_uplink, :band
  json.url cell_tower_url(cell_tower, format: :json)
end
