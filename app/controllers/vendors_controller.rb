class VendorsController < ApplicationController
  before_action :set_vendor, only: [:show, :approve, :disapprove]
  before_action :require_login, only: [:approve, :disapprove, :new, :create, :edit, :update, :destroy]
  before_action :set_user_vendor, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:approve]

  # GET /vendors
  # GET /vendors.json
  def index
    @category = params[:category].nil? ? "Vendors" : params[:category]=="dealer" ? "Dealers Room" : "Artists Alley"
    @vendors = Vendor.where(approved: true)
    @vendors = @vendors.where(category: params[:category]) if params[:category]
    @vendors = @current_user ? @vendors.or(Vendor.where(user_id: @current_user)) : @vendors
  end

  # GET /vendors/1
  # GET /vendors/1.json
  def show
  end

  # GET /vendors/new
  def new
    @vendor = Vendor.new
  end

  # GET /vendors/1/edit
  def edit
  end

  # POST /vendors
  # POST /vendors.json
  def create
    @vendor = current_user.vendors.new(vendor_params)

    respond_to do |format|
      if @vendor.save
        format.html { redirect_to @vendor, notice: 'Vendor was successfully created.' }
        format.json { render :show, status: :created, location: @vendor }
      else
        format.html { render :new }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendors/1
  # PATCH/PUT /vendors/1.json
  def update
    respond_to do |format|
      if @vendor.update(vendor_params)
        format.html { redirect_to @vendor, notice: 'Vendor was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendor }
      else
        format.html { render :edit }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendors/1
  # DELETE /vendors/1.json
  def destroy
    @vendor.destroy
    respond_to do |format|
      format.html { redirect_to vendors_url, notice: 'Vendor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approve
    @vendor.update_attribute(:approved, true)
    redirect_to @vendor
  end

  def disapprove
    @vendor.update_attribute(:approved, false)
    redirect_to @vendor
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor
      @vendor = Vendor.find(params[:id])
    end
    def set_user_vendor
      @vendor = current_user.vendors.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vendor_params
      params.require(:vendor).permit(:name, :about, :email, :website_url, :category, :image)
    end
end
