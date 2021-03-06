class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def getOrders
        @orders = FoodTruck.joins(:orders).where(user_id: params[:user_id])
        respond_to do |format| 
          format.json{render :json => @orders}
        end
  end

  # def shownByEmail
  #   if(params.has_key?(:email))
  #     @user = User.find_by_email(params[:email])
  #     respond_to do |format|
  #       format.json { render :show, status: :created, location: @user }   
  #     end
  #   end
  # end

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

    @user = User.find_by_email(user_params[:email])

    if(user_params.has_key?(:isSignup))

      if(!@user.nil?)
        render json: {
          error: "User already exists",
          status: 400
        }, status: 400
        return
      end

      @user = User.new(user_params.except(:isSignup))

      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      if(!@user.nil? && @user.password == user_params[:password])
        render json: @user
      else
        render json: {
          error: "No such user",
          status: 400
        }, status: 400
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
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :isMerchant, :token, :isSignup)
    end
end
