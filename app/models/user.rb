class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,          presence: true, format: { with: /\A[a-zA-Z]+\z/}
  validates :email,             format: { with:/\A[^@\s]+@[^@\s]+\z/}
  validates :first_name,        presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :family_name,       presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name_kana,   presence: true, format: { with:/\A[ァ-ヶー－]+\z/ }
  validates :family_name_kana,  presence: true, format: { with:/\A[ァ-ヶー－]+\z/ }
  validates :birthday,          presence: true
  
end
