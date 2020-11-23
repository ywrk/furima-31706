class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
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
      render :show
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to action: :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :title, :price, :description, :category_id, :condition_id, :shipping_from_id, :shipping_fee_id, :estimated_shipping_id).merge(user_id: current_user.id)
  end

  def move_to_index
    item = Item.find(params[:id])
    unless current_user.id == item.user_id
    redirect_to action: :index
    end
  end
  
end
