class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                  null: false
      t.text :description,            null: false
      t.integer :category_id,         null: false
      t.integer :condition_id,        null: false
      t.integer :shippingCharge_id,  null: false
      t.integer :prefecture_id,       null: false
      t.integer :daysToShip_id,     null: false
      t.integer :price,               null: false
      t.integer :user_id

      t.timestamps
      
    end
  end
end
