class CreateLocwebThepics < ActiveRecord::Migration
  def change
    create_table :locweb_thepics do |t|
      t.string :posted_by
      t.string :pic_name
      t.string :pic_location_name
      t.string :pic_coords
      t.datetime :pic_timestamp
      t.string :pic_image_path
      t.text :pic_weather_currently
      t.string :pic_status
      t.text :pic_link

      t.timestamps
    end
  end
end
