class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  with_options presence: true do
    validates :image
    validates :item_name
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
    validates :description
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :day_id
  end
  validates :price, numericality: { only_integer: true }
end
