require 'csv'
class BtcGsmSigSurvsController < ApplicationController
  before_filter :authorize
  before_action :set_btc_gsm_sig_surv, only: [:show, :edit, :update, :destroy]
  #this is where we refuse access!

  # GET /btc_gsm_sig_survs
  # GET /btc_gsm_sig_survs.json
  def index
    #@btc_gsm_sig_survs = BtcGsmSigSurv.all
    case request.format
     when Mime::JSON
      btc_gsm_sig_survs = BtcGsmSigSurv.all
      format.json { render json: btc_gsm_sig_survs }
     else
       #this is when we are preparing for a normal HTML output and not to consume as a webservice
      @btc_gsm_sig_survs = BtcGsmSigSurv.paginate(page: params[:page], per_page: 10)

      #temp_map_data = BtcGsmSigSurv.all
      #temp_map_data << CellTower.all
      #temp_map_data.flatten! # This is to have a single array
      #@map_data = temp_map_data.flatten.map{|h| {lng: h.longitude, lat: h.latitude, class: h.class.to_s, algam: h.id}}.to_json do |id, marker|
      #@map_data = (JSON.parse(BtcGsmSigSurv.all.to_gmaps4rails) + JSON.parse(CellTower.all.to_gmaps4rails)).to_json do |id, marker|
      #@map_data = CellTower.all.to_gmaps4rails do |id, marker|

      #old way
      #@map_data = BtcGsmSigSurv.all.to_gmaps4rails do |id, marker|
      #https://stackoverflow.com/questions/8344920/trying-to-populate-gmaps4rails-with-multiple-json-strings-in-one-page
      #@the_surveys = BtcGsmSigSurv.all
      #@map_data = BtcGsmSigSurv.all.to_gmaps4rails |id, marker|



      #@user_array = id.userinfo

      #marker.infowindow render_to_string(:partial => "/btc_gsm_sig_survs/infowindow", :locals => { :signal => id, :user_info => @user_array})

      #marker.infowindow render_to_string(:partial => "/cell_towers/infowindow", :locals => { :tower => id})
      #marker.infowindow render_to_string(:partial => "/cell_towers/infowindow")
      #marker.title "Signal Strength is #{id.sig_str} \n #{id.userinfo[id.userinfo.index('CallScenario')..(id.userinfo.index('","SystemVersion"')-1)]}"


      #marker.title "Signal Strength is #{id.sig_str}"
      #marker.picture({
      #  :picture => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=U|FF0000|000000", # up to you to pass the proper parameters in the url, I guess with a method from device
      #  :width   => 32,
      #  :height  => 32
      #})
      #marker.title "Signal Strength is #{id.btc_cell_id}"

      #marker.json({:sig_str => id.sig_str})
      #marker.json({:extra_info => id.latitude})
      #marker.json({:creation_time => id.created_at})

      #end of the do
      #end
      #@the_surveys = BtcGsmSigSurv.all
      my_lines = Array.new
      @the_surveys = BtcGsmSigSurv.find(:all, :order => "id desc", :limit => 5)
      @part1 = Gmaps4rails.build_markers(@the_surveys) do |survey, marker|
        marker.lat survey.latitude
        marker.lng survey.longitude
        @user_array = survey.userinfo
        temp_userinfo = JSON.parse(survey.userinfo)

        temp_tower = nil

        temp_tower = CellTower.find_by cell_id: temp_userinfo["CID"]

        unless temp_tower.nil? || temp_tower == 0
         #my_lines << {:lat1 => temp_tower.latitude, :lng1 => temp_tower.longitude, :lat2 => survey.latitude, :lng2 => survey.longitude}
         my_lines.push("["+temp_tower.latitude.to_s+","+temp_tower.longitude.to_s+"]"+","+"["+survey.latitude.to_s+","+survey.longitude.to_s+"]")
        end

        marker.title "Customer with IMSI:#{temp_userinfo["IMSI"]} had a signal Strength of #{survey.sig_str}"
        marker.json({:id => survey.id })
        marker.picture({
          "url" => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=U|FF0000|000000",
          "width" =>  32,
          "height" => 32})
        marker.infowindow render_to_string(:partial => "/btc_gsm_sig_survs/infowindow", :locals => { :signal => survey, :user_info => @user_array})
      end

      @final_lines = my_lines
      #now the towers
      @towers = CellTower.all
      @part2 = Gmaps4rails.build_markers(@towers) do |tower, marker|
        marker.lat tower.latitude
        marker.lng tower.longitude
        marker.title "Cell Tower ID #{tower.btc_cell_id}"
        marker.json({:id => tower.id })
        marker.picture({
          "url" => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=T|FFFFFF|FF0000",
          "width" =>  32,
          "height" => 32})
        marker.infowindow render_to_string(:partial => "/cell_towers/infowindow", :locals => { :tower => tower})
      end

      @map_data = @part1 + @part2

      my_towers = Array.new
      @towers.each do |t|
        my_towers << {:lng => t.longitude, :lat => t.latitude, :radius => "1000"}
      end
      #@circle_towers = my_towers.to_json
      @circle_towers = my_towers
     end

  end

  # GET /btc_gsm_sig_survs/1
  # GET /btc_gsm_sig_survs/1.json
  def show
  end

  # GET /btc_gsm_sig_survs/new
  def new
    @btc_gsm_sig_surv = BtcGsmSigSurv.new
  end

  # GET /btc_gsm_sig_survs/1/edit
  def edit
  end

  # POST /btc_gsm_sig_survs
  # POST /btc_gsm_sig_survs.json
  def create
    # this is the old one, commenting it out for the time beign
    @btc_gsm_sig_surv = BtcGsmSigSurv.new(btc_gsm_sig_surv_params)

    # here we have the @btc_gsm_sig_surv instance variable which will equal the output of creating a new
    # object with the passed parameters (the :btc_gsm_sig_surv is basically a type of pointer)

    respond_to do |format|
      if @btc_gsm_sig_surv.save
        format.html { redirect_to @btc_gsm_sig_surv, notice: 'Btc gsm sig surv was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @btc_gsm_sig_surv }
        format.json { render json: @user, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @btc_gsm_sig_surv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /btc_gsm_sig_survs/1
  # PATCH/PUT /btc_gsm_sig_survs/1.json
  def update
    respond_to do |format|
      if @btc_gsm_sig_surv.update(btc_gsm_sig_surv_params)
        format.html { redirect_to @btc_gsm_sig_surv, notice: 'Btc gsm sig surv was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @btc_gsm_sig_surv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /btc_gsm_sig_survs/1
  # DELETE /btc_gsm_sig_survs/1.json
  def destroy
    @btc_gsm_sig_surv.destroy
    respond_to do |format|
      format.html { redirect_to btc_gsm_sig_survs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_btc_gsm_sig_surv
      @btc_gsm_sig_surv = BtcGsmSigSurv.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def btc_gsm_sig_surv_params
      params.require(:btc_gsm_sig_surv).permit(:user_id, :sig_str, :latitude, :longitude, :pic_timestamp, :audit_create_date, :audit_change_date, :userinfo)
    end
end
