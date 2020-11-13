class OrdersController < ApplicationController

  def index
   @order_destination = OrderDestination.new
  end

  def create
    @order_destination = OrderDestination.new(destination_params)
    if @order_destination.valid?
        @order_destination.save
        redirect_to root_path
    else
      render :index
    end
  end

  private
    def destination_params
      params.require(:order_destination).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
    end 

end
