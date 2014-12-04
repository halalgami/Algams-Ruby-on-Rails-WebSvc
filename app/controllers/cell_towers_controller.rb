class CellTowersController < ApplicationController
  before_action :set_cell_tower, only: [:show, :edit, :update, :destroy]

  # GET /cell_towers
  # GET /cell_towers.json
  def index
    @cell_towers = CellTower.all
  end

  # GET /cell_towers/1
  # GET /cell_towers/1.json
  def show
  end

  # GET /cell_towers/new
  def new
    @cell_tower = CellTower.new
  end

  # GET /cell_towers/1/edit
  def edit
  end

  # POST /cell_towers
  # POST /cell_towers.json
  def create
    @cell_tower = CellTower.new(cell_tower_params)

    respond_to do |format|
      if @cell_tower.save
        format.html { redirect_to @cell_tower, notice: 'Cell tower was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cell_tower }
      else
        format.html { render action: 'new' }
        format.json { render json: @cell_tower.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cell_towers/1
  # PATCH/PUT /cell_towers/1.json
  def update
    respond_to do |format|
      if @cell_tower.update(cell_tower_params)
        format.html { redirect_to @cell_tower, notice: 'Cell tower was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cell_tower.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cell_towers/1
  # DELETE /cell_towers/1.json
  def destroy
    @cell_tower.destroy
    respond_to do |format|
      format.html { redirect_to cell_towers_url }
      format.json { head :no_content }
    end
  end

  def towers_gmap


  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cell_tower
      @cell_tower = CellTower.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cell_tower_params
      params.require(:cell_tower).permit(:cgi, :cell_id, :site_name, :site, :latitude, :longitude, :btc_cell_id, :location_type, :node_b, :no_carriers, :eff_hsdpa_cap, :enhanced_uplink, :band)
    end
end
