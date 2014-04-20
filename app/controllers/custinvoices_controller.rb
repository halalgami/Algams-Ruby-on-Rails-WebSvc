class CustinvoicesController < ApplicationController
  before_action :set_custinvoice, only: [:show, :edit, :update, :destroy]

  # GET /custinvoices
  # GET /custinvoices.json
  def index
    @custinvoices = Custinvoice.all
  end

  # GET /custinvoices/1
  # GET /custinvoices/1.json
  def show
  end

  # GET /custinvoices/new
  def new
    @custinvoice = Custinvoice.new
  end

  # GET /custinvoices/1/edit
  def edit
  end

  # POST /custinvoices
  # POST /custinvoices.json
  def create
    @custinvoice = Custinvoice.new(custinvoice_params)

    respond_to do |format|
      if @custinvoice.save
        format.html { redirect_to @custinvoice, notice: 'Custinvoice was successfully created.' }
        format.json { render action: 'show', status: :created, location: @custinvoice }
      else
        format.html { render action: 'new' }
        format.json { render json: @custinvoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custinvoices/1
  # PATCH/PUT /custinvoices/1.json
  def update
    respond_to do |format|
      if @custinvoice.update(custinvoice_params)
        format.html { redirect_to @custinvoice, notice: 'Custinvoice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @custinvoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custinvoices/1
  # DELETE /custinvoices/1.json
  def destroy
    @custinvoice.destroy
    respond_to do |format|
      format.html { redirect_to custinvoices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custinvoice
      @custinvoice = Custinvoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custinvoice_params
      params.require(:custinvoice).permit(:usersubnumfk, :usersubseqnumfk, :invoiceamount, :billyear, :billperiod, :affectedinvoice, :createdate)
    end
end
