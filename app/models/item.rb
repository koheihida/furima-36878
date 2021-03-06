class Item < ApplicationRecord
  has_one_attached :image
  validates :image, presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :goode_name,           presence: true
  validates :explanation,          presence: true
  validates :price,                presence: true,
                                   numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }

  has_many :comments
  belongs_to :user
  has_one :buy
  

  belongs_to :category
  belongs_to :detail
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :period_date

  validates :category_id, numericality: { other_than: 1, message: "can't be select" }
  validates :detail_id, numericality: { other_than: 1, message: "can't be select" }
  validates :postage_id, numericality: { other_than: 1, message: "can't be select" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be select" }
  validates :period_date_id, numericality: { other_than: 1, message: "can't be select" }
end
