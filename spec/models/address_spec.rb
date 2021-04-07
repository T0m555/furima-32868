require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end
  describe '住所登録' do
    context '登録できる時' do
      it '正しい情報が入力されていれば登録できる' do
      end
    end
  end
end
