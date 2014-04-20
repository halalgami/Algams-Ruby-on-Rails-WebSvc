json.array!(@locweb_thepics) do |locweb_thepic|
  json.extract! locweb_thepic, :id, :posted_by, :pic_name, :pic_location_name, :pic_coords, :pic_timestamp, :pic_image_path, :pic_weather_currently, :pic_status, :pic_link
  json.url locweb_thepic_url(locweb_thepic, format: :json)
end
