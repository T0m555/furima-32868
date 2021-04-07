require 'rails_helper'

RSpec.describe Payment, type: :model do
  before do
    @payment = FactoryBot.build(:payment)
  end
  describe '支払情報登録' do
    context '登録できる時' do
      it '正しい情報が入力されていれば登録できる' do
      end
    end
  end
end
