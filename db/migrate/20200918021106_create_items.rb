class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :user_id,             null: false, foreign_key: true
      t.string :name,                 null: false
      t.text :info,                   null: false
      t.integer :category,            null: false
      t.sales_status :integer,        null: false
      t.shipping_fee_status :integer, null: false
      t.prefecture :integer,          null: false
      t.scheduled_delivery :integer,  null: false
      t.price :integer,               null: false
      
      t.timestamps
    end
  end
end
