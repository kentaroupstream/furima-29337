class Purchase
  
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture, :city, :addresses, :building, :phone_number

  with_options presence: true do

    #item_purchaseテーブルのバリデーション
    validates :user_id
    validates :item_id

    #shipping_addressテーブルのバリデーション
    validates :postal_code, format: { with: /\d{3}-\d{4}/ }
    validates :prefecture, numericality: { other_than: 1 }
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\d{ ,11}/ }
    validates :item_purchase

  end

  def save

    item = Item.create(user_id: user_id)
    ItemPurchase.create(user_id: user_id, item_id: item.id)
    ShippingAdress.create(postal_code: postal_code, prefecture: prefecture, city: city, addresses: addresses, building: building, phone_number: phone_number,item_purchase: item_purchase)

  end

end
