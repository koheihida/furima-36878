class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit ]
  before_action :move_to_index, except: [:index, :show]

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
    item_refactoring
  end 

  def edit
    item_refactoring
  end

  def update
    @item = Item.find(params[:id])
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
    params.require(:item).permit(:image, :goode_name, :explanation, :category_id, :detail_id, :postage_id, :prefecture_id,
                                 :period_date_id, :price).merge(user_id: current_user.id)
  end

  def item_refactoring
    @item = Item.find(params[:id])
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless  current_user.id == @item.user_id
      redirect_to action: :index
    end
  end
end
