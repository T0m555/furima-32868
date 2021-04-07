require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end
  describe '住所登録' do
    context '登録できる時' do
      it '正しい情報が入力されていれば登録できる' do
        expect(@address).to be_valid
      end
      it 'ビル名が入力されていなくても登録できる' do
        @address.building_name = ''
        expect(@address).to be_valid
      end
    end
    context '登録できない時' do
      it '郵便番号が入力されていないと登録できない' do
        @address.post_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Post number can't be blank")
      end
      it '郵便番号にハイフンが無い場合登録できない' do
        @address.post_number.sub!(/-/, '')
        @address.valid?
        expect(@address.errors.full_messages).to include("Post number is invalid")
      end
      it '郵便番号の正しい位置にハイフンが無い場合登録できない' do
        @address.post_number = '1234-567'
        @address.valid?
        expect(@address.errors.full_messages).to include("Post number is invalid")
      end
      it '都道府県番号が1では登録できない' do
        @address.prefecture_id = 1
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市町村欄が入力されていないと登録できない' do
        @address.municipality = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '住所欄が入力されていないと登録できない' do
        @address.address = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が入力されていないと登録できない' do
        @address.phone_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が11桁以上では登録できない' do
        @address.phone_number = '111111111111'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が11桁未満では登録できない' do
        @address.phone_number = '1111111111'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が全角では登録できない' do
        @address.phone_number = '１１１１１１１１１１１'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号がハイフンありでは登録できない' do
        @address.phone_number = '111-1111-1111'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
