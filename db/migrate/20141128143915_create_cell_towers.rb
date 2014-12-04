class CreateCellTowers < ActiveRecord::Migration
  def change
    create_table :cell_towers do |t|
      t.string :cgi
      t.integer :cell_id
      t.string :site_name
      t.string :site
      t.float :latitude
      t.float :longitude
      t.string :btc_cell_id
      t.string :location_type
      t.integer :node_b
      t.integer :no_carriers
      t.float :eff_hsdpa_cap
      t.float :enhanced_uplink
      t.string :band

      t.timestamps
    end
  end
end
