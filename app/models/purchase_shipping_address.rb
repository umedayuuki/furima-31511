class PurchaseShippingAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postalcode, :area_id, :munitipalities, :address, :phonenumber, :purchase_id, :building_name
  attr_accessor :token

  with_options presence: true do
    validates :postalcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :munitipalities
    validates :address
    validates :phonenumber, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :area_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postalcode: postalcode, munitipalities: munitipalities, address: address, phonenumber: phonenumber, area_id: area_id, purchase_id: purchase.id, building_name: building_name)
  end
end