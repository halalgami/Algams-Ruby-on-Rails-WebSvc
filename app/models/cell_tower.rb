class CellTower < ActiveRecord::Base
  #Below property is in case we do not hve the
  #Lat and long which will take a geocode
  #and generate the lat/long
  #remember to add the css style sheet for the gmaps gem
  #acts_as_gmappable :process_geocoding => false

end
