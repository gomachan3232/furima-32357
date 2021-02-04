class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  before_action :item_user_correct, only: [:edit, :update, :destroy]

  def index
    @item = Item.all.order(created_at: :desc)
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
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
      @item = Item.destroy(params[:id])
      redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :send_day_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def item_user_correct
    redirect_to action: :index unless @item.user_id == current_user.id
  end
end
