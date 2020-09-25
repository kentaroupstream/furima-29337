class ShippingAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
    
  belongs_to :item_purchase

  with_options presence: true do
    validates :postal_code, format: { with: /\d{3}-\d{4}/ }
    validates :prefecture, numericality: { other_than: 1 }
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\d{ ,11}/ }
    validates :item_purchase
  end

end