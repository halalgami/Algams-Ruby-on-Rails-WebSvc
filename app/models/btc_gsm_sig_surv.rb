class BtcGsmSigSurv < ActiveRecord::Base

after_initialize :default_values
#Below property is in case we do not hve the
#Lat and long which will take a geocode
#and generate the lat/long
#remember to add the css style sheet for the gmaps gem
acts_as_gmappable :process_geocoding => false

private
 def default_values
  self.pic_timestamp = Time.now
  self.audit_create_date = Time.now
 end

 def gmaps4rails_address
  address
 end

 def btcgsmsigsurv_params
  params.require(:person).permit(:user_info, :latitude, :longitude, :sig_str, :pic_timestamp)
 end
end
