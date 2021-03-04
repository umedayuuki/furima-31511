class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :postalcode, null: false
      t.string :munitipalities, null: false
      t.string :address, null: false
      t.string :phonenumber, null: false
      t.string :building_name
      t.integer :area_id, null: false
      t.references :purchase, foreign_key: true, null: false
      t.timestamps
    end
  end
end
