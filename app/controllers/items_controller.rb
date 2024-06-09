class ItemsController < ApplicationController

  def index
  end 

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to '/'
  end





  private

  def item_params
    params.require(:item).permit(:image, :title, :review, :price, :category_id, :condition_id, :shipping_id, :region_id, :shipping_date_id).merge(user_id: current_user.id)
  end

  
end
