class Purchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :token

  with_options presence: true do
    # item_purchaseテーブルのバリデーション
    validates :user_id
    validates :item_id

    # shipping_addressテーブルのバリデーション
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :addresses
    validates :phone_number, length: { maximum: 11 }

    # クレジット機能のトークン
    validates :token
  end

  def save
    item_purchase = ItemPurchase.create!(user_id: user_id, item_id: item_id)
    ShippingAddress.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, item_purchase_id: item_purchase.id)
  end
end
