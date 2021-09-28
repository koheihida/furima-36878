class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,          presence: true, format: { with: /\A[a-zA-Z]+\z/}
  # validates :email,             presence: true, format: { with:/\A[^@\s]+@[^@\s]+\z/}
  validates :password,          presence: true, length: { minimum: 6 },format: {with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}
  validates :first_name,        presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_name,       presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana,   presence: true, format: { with:/\A[ァ-ヶー－]+\z/ }
  validates :family_name_kana,  presence: true, format: { with:/\A[ァ-ヶー－]+\z/ }
  validates :birthday,          presence: true
  
end
