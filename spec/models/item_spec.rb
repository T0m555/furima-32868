require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '商品登録ができるとき' do
      it '商品情報が正しく入力されている場合登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品登録ができないとき' do
      it '商品名が入力されていないと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が入力されていないと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーidが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'コンディションidが1では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it '送料条件idが1では登録できない' do
        @item.shippingCharge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shippingcharge must be other than 1")
      end
      it '発送地域idが1では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '発送日idが1では登録できない' do
        @item.daysToShip_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Daystoship must be other than 1")
      end
      it '価格が入力されていないと登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格が9,999,999円より大きい場合では登録でいない'  do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '価格が全角数字では登録できない'  do
        @item.price = "１５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
