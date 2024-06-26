class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:destroy, :edit]
 
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
  end
 
  def edit
    redirect_to root_path if @item.order
  end

  def update
   if @item.update(item_params)
    redirect_to item_path
   else
    render :edit, status: :unprocessable_entity
   end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end
 

  private

  def item_params
    params.require(:item).permit(:image, :title, :review, :price, :category_id, :condition_id, :shipping_id, :region_id, :shipping_date_id).merge(user_id: current_user.id)
  end

  
end
