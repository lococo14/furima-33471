class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index ]

  def index
    @items = Item.all.includes(:user).order("created_at DESC")
  end
  

  def new
    @item = Item.new 
  end
  
  def create
   @item = Item.new(item_params)
   if @item.valid?
      @item.save
      redirect_to action: :index
   else
      render :new
   end      
  end 

  def show
    @item = Item.find(params[:id])
  end  

  def edit
    @item = Item.find(params[:id])
  end  

  private 
  
  def item_params
    params.require(:item).permit(:item_name,:image, :description, :price, :category_id,:condition_id,:shipping_payer_id,:shipping_date_id, :prefecture_id).merge(user_id: current_user.id)
  end

end
