require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe 'order登録' do
    context '登録できる時' do
      it '正しい情報が入力されていれば登録できる' do
        expect(@order).to be_valid
      end
      it 'ビル名が入力されていなくても登録できる' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end
    context '登録できない時' do
      it '郵便番号が入力されていないと登録できない' do
        @order.post_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post number can't be blank")
      end
      it '郵便番号にハイフンが無い場合登録できない' do
        @order.post_number.sub!(/-/, '')
        @order.valid?
        expect(@order.errors.full_messages).to include("Post number is invalid")
      end
      it '郵便番号の正しい位置にハイフンが無い場合登録できない' do
        @order.post_number = '1234-567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post number is invalid")
      end
      it '都道府県番号が1では登録できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市町村欄が入力されていないと登録できない' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end
      it '住所欄が入力されていないと登録できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が入力されていないと登録できない' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が11桁以上では登録できない' do
        @order.phone_number = '111111111111'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が11桁未満では登録できない' do
        @order.phone_number = '1111111111'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が全角では登録できない' do
        @order.phone_number = '１１１１１１１１１１１'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号がハイフンありでは登録できない' do
        @order.phone_number = '111-1111-1111'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が英数混合では登録できないこと' do
        @order.phone_number = 'aaaaa111111'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it 'トークンが無いと登録できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it 'UserIDが空では登録できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'ItemIDが空では登録できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end

end
