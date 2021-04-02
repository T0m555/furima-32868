class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :ensure_user, only: [:update, :edit]
  before_action :set_item, only: [:show, :edit, :update]
 
  def index
    @items = Item.order(id: :DESC)
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
    
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def ensure_user
    @items = current_user.items
    @item = @items.find_by(id: params[:id])
    if @item == nil
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

end

