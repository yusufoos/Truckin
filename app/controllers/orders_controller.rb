class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token  
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    if(params.has_key?(:user_id))
      @orders = Order.all.where("user_id = ?",params[:user_id])
    elsif
      @orders = Order.all.where("food_truck_id = ?",params[:food_truck_id])      
    else
      @orders = Order.all
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show

  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  def send_notification(token,truckName)
    logger.info "Device token registrato: " + token
    APNS.send_notification(token, 'Your order from ' + truckName + ' is ready!')
    redirect_to home_index_path, :notice => "Notification sent to device #{token}"
  end

  # POST /orders
  # POST /orders.json
  def create
    
    if(order_params.has_key?(:orderId))
      @order = Order.find_by_id(order_params[:orderId])

      if(!@order.nil?)
        @user = User.find_by_id(@order.user_id)
        @food_truck = FoodTruck.find_by_id(@order.food_truck_id)
        send_notification(@user.token, @food_truck.name)
      else
        render json: {
          error: "No such order",
          status: 400
        }, status: 400
      end
    else
      @order = Order.new(order_params)
      respond_to do |format|
        if @order.save
          format.html { redirect_to @order, notice: 'Order was successfully created.' }
          format.json { render :show, status: :created, location: @order }
        else
          format.html { render :new }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :food_truck_id, :orderId)
    end
end
