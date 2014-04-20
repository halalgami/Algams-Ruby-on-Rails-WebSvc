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
      @btc_gsm_sig_survs = BtcGsmSigSurv.paginate(page: params[:page], per_page: 3)
      @map_data = BtcGsmSigSurv.all.to_gmaps4rails do |id, marker|

      #@user_array = CSV.parse("LAC:301,IPAddresses:WifiIPAddress:192.16,")
      @user_array = id.userinfo
      marker.infowindow render_to_string(:partial => "/btc_gsm_sig_survs/infowindow", :locals => { :signal => id, :user_info => @user_array})
      marker.title "Signal Strength is #{id.sig_str} <br> #{user_info[user_info.index('"CallScenario":'),(user_info.index(','))]}"
      #marker.json({:sig_str => id.sig_str})
      #marker.json({:extra_info => id.latitude})
      #marker.json({:creation_time => id.created_at})
      end
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
      params.require(:btc_gsm_sig_surv).permit(:user_id, :sig_str, :sig_lat, :sig_longa, :pic_timestamp, :audit_create_date, :audit_change_date, :userinfo)
    end
end
