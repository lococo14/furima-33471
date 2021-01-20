class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index
  before_action :sold_out

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(address_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def address_params
    params.require(:order_address).permit(:zip_code, :prefecture_id, :city, :street_name, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: address_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    item = Item.find(params[:item_id])
    if current_user.id == item.user_id
    redirect_to root_path
  end
 end 

  def sold_out
    item = Item.find(params[:item_id])
    if item.order.present?
    redirect_to root_path
    end
  end  
end
