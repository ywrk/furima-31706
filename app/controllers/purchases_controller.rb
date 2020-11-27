class PurchasesController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!
  before_action :move_to_index

  def index
    @user_buy = UserBuy.new
  end

  def create
    @user_buy = UserBuy.new(purchase_params)
    if @user_buy.valid?
      pay_item
      @user_buy.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.require(:user_buy).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :purchase_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id
      redirect_to items_path
    elsif @item.purchase.present?
      redirect_to items_path
    end
  end

  def pay_item
    item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
