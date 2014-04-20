class CustpaymentsController < ApplicationController
  before_action :set_custpayment, only: [:show, :edit, :update, :destroy]

  # GET /custpayments
  # GET /custpayments.json
  def index
    @custpayments = Custpayment.all
  end

  # GET /custpayments/1
  # GET /custpayments/1.json
  def show
  end

  # GET /custpayments/new
  def new
    @custpayment = Custpayment.new
  end

  # GET /custpayments/1/edit
  def edit
  end

  # POST /custpayments
  # POST /custpayments.json
  def create
    @custpayment = Custpayment.new(custpayment_params)

    respond_to do |format|
      if @custpayment.save
        format.html { redirect_to @custpayment, notice: 'Custpayment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @custpayment }
      else
        format.html { render action: 'new' }
        format.json { render json: @custpayment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custpayments/1
  # PATCH/PUT /custpayments/1.json
  def update
    respond_to do |format|
      if @custpayment.update(custpayment_params)
        format.html { redirect_to @custpayment, notice: 'Custpayment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @custpayment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custpayments/1
  # DELETE /custpayments/1.json
  def destroy
    @custpayment.destroy
    respond_to do |format|
      format.html { redirect_to custpayments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custpayment
      @custpayment = Custpayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custpayment_params
      params.require(:custpayment).permit(:paymentsource, :paymentamount, :affectedinvoice, :createdate)
    end
end
