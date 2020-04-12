class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:index]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    if (existing_user = User.find_by(email: [user_params[:email]]))
      #u = User.find_by(email: params[:email])
      existing_user.send_login_link
      redirect_to "/", notice: 'Sending you a new login link.'
    else
      @user = User.new(user_params)
      respond_to do |format|
        if @user.save
          request.session[:user_id] = @user.id
          @current_user = @user
          format.html { redirect_to '/pending' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    #@user.destroy # Generally not safe because there may be objects linked to the user that would then be uneditable.
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def reset
    u = User.find_by(email: params[:email])
    u.send_login_link
    redirect_to "/", notice: 'Sending reset link.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
      redirect_to "/pending" if @user.nil?
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email)
    end
end
