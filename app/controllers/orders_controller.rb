class OrdersController < ApplicationController

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])

  end
  
  def create
    @order_address = OrderAddress.new(address_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
       @order_address.save
      redirect_to root_path
    else  
      render action: :index
    end      
  end  

  private
    def address_params
      params.require(:order_address).permit(:zip_code, :prefecture_id,:city,:street_name,:building_name,:phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
    end   

end
