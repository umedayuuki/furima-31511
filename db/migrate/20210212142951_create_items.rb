class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.integer :price
      t.text :description
      t.integer :category_id
      t.integer :states_id
      t.integer :bueden_id
      t.integer :area_id
      t.integer :day_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
