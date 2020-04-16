class CartproductsController < ApplicationController
  #before_action :set_cartproduct, only: [:show, :edit, :update, :destroy]
  before_action :set_product

  def create # Add to your cart.
    current_cart.add_product(@product)
  end

  def update #Change quantity

  end

  def destroy #Remove from cart.
    Cartproduct.find_by(product_id: params[:id], cart_id: current_cart.id).destroy
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  #
  #
  # # GET /cartproducts
  # # GET /cartproducts.json
  # def indexXXXXXXXX
  #   @cartproducts = Cartproduct.all
  # end
  #
  # # GET /cartproducts/1
  # # GET /cartproducts/1.json
  # def showXXXXXXXX
  # end
  #
  # # GET /cartproducts/new
  # def newXXXXXXXX
  #   @cartproduct = Cartproduct.new
  # end
  #
  # # GET /cartproducts/1/edit
  # def editXXXXXXXX
  # end
  #
  # # POST /cartproducts
  # # POST /cartproducts.json
  # def createXXXXXXXX
  #   @cartproduct = Cartproduct.new(cartproduct_params)
  #
  #   respond_to do |format|
  #     if @cartproduct.save
  #       format.html { redirect_to @cartproduct, notice: 'Cartproduct was successfully created.' }
  #       format.json { render :show, status: :created, location: @cartproduct }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @cartproduct.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # PATCH/PUT /cartproducts/1
  # # PATCH/PUT /cartproducts/1.json
  # def updateXXXXXXXX
  #   respond_to do |format|
  #     if @cartproduct.update(cartproduct_params)
  #       format.html { redirect_to @cartproduct, notice: 'Cartproduct was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @cartproduct }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @cartproduct.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # DELETE /cartproducts/1
  # # DELETE /cartproducts/1.json
  # def destroyXXXXXXXX
  #   @cartproduct.destroy
  #   respond_to do |format|
  #     format.html { redirect_to cartproducts_url, notice: 'Cartproduct was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end
  #
  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_cartproduct
  #     @cartproduct = Cartproduct.find(params[:id])
  #   end
  #
  #   # Only allow a list of trusted parameters through.
  #   def cartproduct_params
  #     params.require(:cartproduct).permit(:quantity, :cart_id, :product_id)
  #   end
end
