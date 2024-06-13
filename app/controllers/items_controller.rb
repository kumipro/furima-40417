class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]


  def index
   @items = Item.order(created_at: :desc)

  end 

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
   
     if @item.save
      redirect_to root_path
     else
      render :new, status: :unprocessable_entity
     end
  end

  def show
    @item = Item.find(params[:id])
  end
 
  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to item_path
  end
  


  private

  def item_params
    params.require(:item).permit(:image, :title, :review, :price, :category_id, :condition_id, :shipping_id, :region_id, :shipping_date_id).merge(user_id: current_user.id)
  end

  
end
