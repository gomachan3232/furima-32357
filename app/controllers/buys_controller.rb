class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  def index

    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
    redirect_to root_path  
    elsif @item.buy.present?
      redirect_to root_path
    else
    @buy_form = BuyForm.new
    end
   
  end


  def create
    @buy_form = BuyForm.new(buy_params)
    if @buy_form.valid?
      @buy_form.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  
  def buy_params
    params.require(:buy_form).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id, :user_id).merge(user_id: current_user.id,item_id: @item = (params[:item_id]))
  end
  
end
