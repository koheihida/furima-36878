class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :buy_set, only: [:index, :create, :move_to_index]
  before_action :move_to_index


  def index
    @buy = BuysAddress.new
  end
  
  def create
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
    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: address_params[:token],   
      currency: 'jpy'                 
    )
  end

  def move_to_index
    if @item.buy.present? || current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def buy_set
    @item = Item.find(params[:item_id])
  end

end
