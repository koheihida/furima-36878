class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit ]
  before_action :item_set, only: [:edit,:show,:move_to_index,:update ]
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
    
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  # def destroy
  #   @item = Item.find(item_params[:id])
  #   @item.destroy
  # end

  private

  def item_params
    params.require(:item).permit(:image, :goode_name, :explanation, :category_id, :detail_id, :postage_id, :prefecture_id,:period_date_id, :price).merge(user_id: current_user.id)
  end

  def item_set
    @item = Item.find(params[:id])
  end

  def move_to_index
    item_set
    unless  current_user.id == @item.user.id
      redirect_to action: :index
    end
  end
end
