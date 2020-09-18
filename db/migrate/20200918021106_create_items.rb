class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :user_id,             null: false, foreign_key: true
      t.string :name,                 null: false
      t.text :info,                   null: false
      t.integer :category,            null: false
      t.integer :sales_status,        null: false
      t.integer :shipping_fee_status, null: false
      t.integer :prefecture,          null: false
      t.integer :scheduled_delivery,  null: false
      t.integer :price,               null: false

      t.timestamps
    end
  end
end
