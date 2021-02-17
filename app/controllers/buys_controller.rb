class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_find, only: [:index, :create]

  def index
    if current_user.id == @item.user_id || @item.buy.present?
      redirect_to root_path
    else
      @buy_form = BuyForm.new
    end
  end

  def create
    @buy_form = BuyForm.new(buy_params)
    if @buy_form.valid?
      pay_item
      @buy_form.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buy_params
    params.require(:buy_form).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end
end
