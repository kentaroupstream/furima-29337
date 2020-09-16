class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :item_purchases

  with_options presence: true do
    validates :nickname, format: { with: /\A[ぁ-んァ-ン一-龥a-z0-9]+\z/, message: "can't be blank"}
    # validates :email, uniqueness: true, format: { with: /\A[\w\-._]+@[\w\-._]+\.[A-Za-z]+\z/, message: "can't be blank"}
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+{6,}\z/i, message: "Include both letters and numbers"}
    # validates :password_confirmation, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+{6,}\z/i, message: "Include both letters and numbers"}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
    validates :birth_date, presence: true
  end
  
end
