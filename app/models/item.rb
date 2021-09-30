class Item < ApplicationRecord
  has_one_attached :image
  validates :image, presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions 

  validates :goode_name,           presence: true
  validates :explanation,          presence: true
  validates :price,                presence: true, format: {with: /\A[0-9]+\z/}
  
  has_many :comments
  belongs_to :user
  has_one :buy

  belongs_to :category
  belongs_to :detail
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :period_date

  validates :category_id, numericality: {other_than:1, message: "can't be blank"}
  validates :detail_id, numericality: {other_than:1, message: "can't be blank"}
  validates :postage_id, numericality: {other_than:1, message: "can't be blank"}
  validates :prefecture_id, numericality: {other_than:1, message: "can't be blank"}
  validates :period_date_id, numericality: {other_than:1, message: "can't be blank"}
end
