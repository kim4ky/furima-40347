class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user == @item.user
    @buy_shipping = BuyShipping.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_shipping = BuyShipping.new(buy_shipping_params)
    if @buy_shipping.valid?
      @buy_shipping.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def buy_shipping_params
    params.require(:buy_shipping).permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
