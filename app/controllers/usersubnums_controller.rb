class UsersubnumsController < ApplicationController
  before_action :set_usersubnum, only: [:show, :edit, :update, :destroy]

  # GET /usersubnums
  # GET /usersubnums.json
  def index
    @usersubnums = Usersubnum.all
  end

  # GET /usersubnums/1
  # GET /usersubnums/1.json
  def show
  end

  # GET /usersubnums/new
  def new
    @usersubnum = Usersubnum.new
  end

  # GET /usersubnums/1/edit
  def edit
  end

  # POST /usersubnums
  # POST /usersubnums.json
  def create
    @usersubnum = Usersubnum.new(usersubnum_params)

    respond_to do |format|
      if @usersubnum.save
        format.html { redirect_to @usersubnum, notice: 'Usersubnum was successfully created.' }
        format.json { render action: 'show', status: :created, location: @usersubnum }
      else
        format.html { render action: 'new' }
        format.json { render json: @usersubnum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usersubnums/1
  # PATCH/PUT /usersubnums/1.json
  def update
    respond_to do |format|
      if @usersubnum.update(usersubnum_params)
        format.html { redirect_to @usersubnum, notice: 'Usersubnum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @usersubnum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usersubnums/1
  # DELETE /usersubnums/1.json
  def destroy
    @usersubnum.destroy
    respond_to do |format|
      format.html { redirect_to usersubnums_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usersubnum
      @usersubnum = Usersubnum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usersubnum_params
      params.require(:usersubnum).permit(:subnum, :status, :createdate)
    end
end
