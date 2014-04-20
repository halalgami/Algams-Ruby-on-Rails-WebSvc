class LocwebThepicsController < ApplicationController
  before_action :set_locweb_thepic, only: [:show, :edit, :update, :destroy]

  # GET /locweb_thepics
  # GET /locweb_thepics.json
  def index
    @locweb_thepics = LocwebThepic.all
  end

  # GET /locweb_thepics/1
  # GET /locweb_thepics/1.json
  def show
  end

  # GET /locweb_thepics/new
  def new
    @locweb_thepic = LocwebThepic.new
  end

  # GET /locweb_thepics/1/edit
  def edit
  end

  # POST /locweb_thepics
  # POST /locweb_thepics.json
  def create
    @locweb_thepic = LocwebThepic.new(locweb_thepic_params)

    respond_to do |format|
      if @locweb_thepic.save
        format.html { redirect_to @locweb_thepic, notice: 'Locweb thepic was successfully created.' }
        format.json { render action: 'show', status: :created, location: @locweb_thepic }
      else
        format.html { render action: 'new' }
        format.json { render json: @locweb_thepic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locweb_thepics/1
  # PATCH/PUT /locweb_thepics/1.json
  def update
    respond_to do |format|
      if @locweb_thepic.update(locweb_thepic_params)
        format.html { redirect_to @locweb_thepic, notice: 'Locweb thepic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @locweb_thepic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locweb_thepics/1
  # DELETE /locweb_thepics/1.json
  def destroy
    @locweb_thepic.destroy
    respond_to do |format|
      format.html { redirect_to locweb_thepics_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_locweb_thepic
      @locweb_thepic = LocwebThepic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def locweb_thepic_params
      params.require(:locweb_thepic).permit(:posted_by, :pic_name, :pic_location_name, :pic_coords, :pic_timestamp, :pic_image_path, :pic_weather_currently, :pic_status, :pic_link)
    end
end
