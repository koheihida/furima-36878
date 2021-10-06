class BuysAddress 
  include ActiveModel::Model
  attr_accessor :postcode, :prefectures_id, :city, :block, :building, :tel_number,:user_id, :item_id, :token
  
  
  with_options presence: true do
      validates :token
      validates :user_id
      validates :item_id
      validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefectures_id, numericality: {other_than: 0, message: "can't be blank"}
  end 

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    Address.create(postcode: postcode, prefectures_id: prefectures_id, city: city, block: block,building: building, tel_number: tel_number, buy_id: buy.id)
  end
end