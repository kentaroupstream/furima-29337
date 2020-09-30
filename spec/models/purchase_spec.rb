require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase = FactoryBot.build(:purchase, user_id: @user.id, item_id: @item.id)
    sleep(1)
  end

  describe '商品購入' do
    context '商品購入が上手くいくとき' do
      it '全ての商品情報が存在すれば登録できる' do
        expect(@purchase).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'tokenが空だと登録できない' do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと登録できない' do
        @purchase.postal_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと登録できない' do
        @purchase.postal_code = '1234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefecture_idが1だと登録できない' do
        @purchase.prefecture_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityが空だと登録できない' do
        @purchase.city = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空だと登録できない' do
        @purchase.addresses = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11文字以上だと登録できない' do
        @purchase.phone_number = '0901549849854915823456789'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
    end
  end
end
