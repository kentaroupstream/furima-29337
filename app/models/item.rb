class Item < ApplicationRecor

  belongs_to :user
  has_one :item_purchase
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :info
    validates :category
    validates :sales_status
    validates :shipping_fee_status
    validates :prefecture
    validates :scheduled_delivery
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end

end
