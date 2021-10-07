class BuysAddress 
  include ActiveModel::Model
  attr_accessor :postcode, :prefectures_id, :city, :block, :building, :tel_number,:user_id, :item_id, :token
  
  
  with_options presence: true do
      validates :token
      validates :city
      validates :block
      validates :user_id
      validates :item_id
      validates :tel_number, format: {with:/\A\d{10,11}\z/, message: "Phone number is an invalid value"}
      validates :postcode, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefectures_id, numericality: {other_than: 1, message: "can't be select"}
  end 

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    Address.create(postcode: postcode, prefectures_id: prefectures_id, city: city, block: block,building: building, tel_number: tel_number, buy_id: buy.id)
  end
end