class FoodTrucksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_food_truck, only: [:show, :edit, :update, :destroy]

  # GET /food_trucks
  # GET /food_trucks.json
  def index
    if(params.has_key?(:user_id))
      @food_trucks = FoodTruck.all.where("user_id = ?",params[:user_id])
    else
      @food_trucks = FoodTruck.all
    end
  end

  # GET /food_trucks/1
  # GET /food_trucks/1.json
  def show
  end

  # GET /food_trucks/new
  def new
    @food_truck = FoodTruck.new
  end

  # GET /food_trucks/1/edit
  def edit
  end

  # POST /food_trucks
  # POST /food_trucks.json
  def create
    @food_truck = FoodTruck.new(food_truck_params)

    respond_to do |format|
      if @food_truck.save
        format.html { redirect_to @food_truck, notice: 'Food truck was successfully created.' }
        format.json { render :show, status: :created, location: @food_truck }
      else
        format.html { render :new }
        format.json { render json: @food_truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_trucks/1
  # PATCH/PUT /food_trucks/1.json
  def update
    respond_to do |format|
      if @food_truck.update(food_truck_params)
        format.html { redirect_to @food_truck, notice: 'Food truck was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_truck }
      else
        format.html { render :edit }
        format.json { render json: @food_truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_trucks/1
  # DELETE /food_trucks/1.json
  def destroy
    @food_truck.destroy
    respond_to do |format|
      format.html { redirect_to food_trucks_url, notice: 'Food truck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_truck
      @food_truck = FoodTruck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_truck_params
      params.require(:food_truck).permit(:merchantUserEmail, :name, :foodType, :longitude, :latitude, :user_id)
    end
end
