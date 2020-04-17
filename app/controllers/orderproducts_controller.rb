class OrderproductsController < ApplicationController
  before_action :set_orderproduct, only: [:show, :edit, :update, :destroy]

  # GET /orderproducts
  # GET /orderproducts.json
  def index
    @orderproducts = Orderproduct.all
  end

  # GET /orderproducts/1
  # GET /orderproducts/1.json
  def show
  end

  # GET /orderproducts/new
  def new
    @orderproduct = Orderproduct.new
  end

  # GET /orderproducts/1/edit
  def edit
  end

  # POST /orderproducts
  # POST /orderproducts.json
  def create
    @orderproduct = Orderproduct.new(orderproduct_params)

    respond_to do |format|
      if @orderproduct.save
        format.html { redirect_to @orderproduct, notice: 'Orderproduct was successfully created.' }
        format.json { render :show, status: :created, location: @orderproduct }
      else
        format.html { render :new }
        format.json { render json: @orderproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orderproducts/1
  # PATCH/PUT /orderproducts/1.json
  def update
    respond_to do |format|
      if @orderproduct.update(orderproduct_params)
        format.html { redirect_to @orderproduct, notice: 'Orderproduct was successfully updated.' }
        format.json { render :show, status: :ok, location: @orderproduct }
      else
        format.html { render :edit }
        format.json { render json: @orderproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orderproducts/1
  # DELETE /orderproducts/1.json
  def destroy
    @orderproduct.destroy
    respond_to do |format|
      format.html { redirect_to orderproducts_url, notice: 'Orderproduct was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orderproduct
      @orderproduct = Orderproduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def orderproduct_params
      params.require(:orderproduct).permit(:quantity, :price, :order_id, :status)
    end
end

