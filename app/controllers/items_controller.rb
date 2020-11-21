class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    # @items = Item.all
    # 後で実装する「商品一覧表示機能」でブランチを作成した際に、差分としてプルリクエストに反映されなくなってしまうため
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

  private

  def item_params
    params.require(:item).permit(:image, :title, :price, :description, :category_id, :condition_id, :shipping_from_id, :shipping_fee_id, :estimated_shipping_id).merge(user_id: current_user.id)
  end
end
