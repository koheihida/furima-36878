class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end 

  private

  def item_params
    params.require(:item).permit(:image, :goode_name, :explanation, :category_id, :detail_id, :postage_id, :prefecture_id,
                                 :period_date_id, :price).merge(user_id: current_user.id)
  end
end
