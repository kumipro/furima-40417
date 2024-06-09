class ItemsController < ApplicationController

  def index
  end 

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
   
     if @item.save
      redirect_to root_path
     else
      render :new, status: :unprocessable_entity
     end
  end





  private

  def item_params
    params.require(:item).permit(:image, :title, :review, :price, :category_id, :condition_id, :shipping_id, :region_id, :shipping_date_id).merge(user_id: current_user.id)
  end

  
end
