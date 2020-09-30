class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :item_purchases

  name_validation = { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters'}
  name_kana_validation = {with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters'}

  with_options presence: true do
    validates :nickname, format: { with: /\A[ぁ-んァ-ン一-龥a-z0-9]+\z/i }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+{6,}\z/i, message: 'Include both letters and numbers' }
    validates :first_name, format: name_validation
    validates :last_name, format: name_validation
    validates :first_name_kana, format: name_kana_validation
    validates :last_name_kana, format: name_kana_validation
    validates :birth_date
  end
end
