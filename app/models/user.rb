class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  with_options presence: true do
    validates :nickname
    validates :bithday
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
      validates :firstname
      validates :lastname
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :firstname_furigana
      validates :lastname_furigana
    end
  end
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }
end
