class BuysController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @buy = BuysAddress.new
  end
  # 1.フォームオブジェクトのmodelに保存できるようにする　L17
  # 2.create = new + save なので
  # 3.params を１つにする(address_params)の記述を見直す
  def create
    @item = Item.find(params[:item_id])
    @buy = BuysAddress.new(address_params)
    if @buy.valid?
     
      pay_item
      @buy.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def address_params
    params.require(:buys_address).permit(:postcode, :prefectures_id, :city, :building, :block, :tel_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_6c7838d730073977ed269212"  
    Payjp::Charge.create(
      amount: @item.price,
      card: address_params[:token],   
      currency: 'jpy'                 
    )
  end

end
