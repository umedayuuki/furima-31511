class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  validates :nickname, presence: true
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :firstname, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
  validates :lastname, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
  validates :firstname_furigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :lastname_furigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :bithday, presence: true
end
