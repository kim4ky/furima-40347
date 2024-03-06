require 'rails_helper'

RSpec.describe BuyShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user: user)
    @buy_shipping = FactoryBot.build(:buy_shipping, user_id: user.id, item_id: item.id)
  end

  describe '商品購入記録の保存' do
    context '商品購入記録の保存ができる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_shipping).to be_valid
      end
    end
    context '商品購入記録の保存ができない場合' do
      it 'userが紐付いていなければ保存できない' do
        @buy_shipping.user_id = nil
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていなければ保存できない' do
        @buy_shipping.item_id = nil
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Item can't be blank")
      end

      it 'post_codeが空では保存できない' do
        @buy_shipping.post_code = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが半角のハイフンを含んだ正しい形式でなければ保存できない' do
        @buy_shipping.post_code = '1234567'
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end

      it 'prefecture_idが選択されていないと保存できない' do
        @buy_shipping.prefecture_id = nil
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'municipalityが空では保存できない' do
        @buy_shipping.municipality = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'addressが空では保存できない' do
        @buy_shipping.address = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では保存できない' do
        @buy_shipping.phone_number = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが9桁以下だと購入できないこと' do
        @buy_shipping.phone_number = '080123456'
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Phone number is too short")
      end

      it '電話番号が半角数値でないと購入できないこと' do
        @buy_shipping.phone_number = '０8012345678'
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
    end
  end
end
