class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit ]
  before_action :item_set, only: [:edit,:show,:update ,:destroy]
  before_action :move_to_index, only: [:edit]
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
  end 

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy  
    if user_signed_in? && current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    end  
  end

  private

  def item_params
    params.require(:item).permit(:image, :goode_name, :explanation, :category_id, :detail_id, :postage_id, :prefecture_id,:period_date_id, :price).merge(user_id: current_user.id)
  end

  def item_set
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless  current_user.id == @item.user.id
      redirect_to action: :index
    end
  end

  
end
