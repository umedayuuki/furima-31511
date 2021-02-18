class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :states, :bueden, :area, :day

  with_options presence: true do
    validates :image
    validates :item_name
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
    validates :description
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :states_id
    validates :bueden_id
    validates :area_id
    validates :day_id
  end
  validates :price, numericality: { only_integer: true }
end
