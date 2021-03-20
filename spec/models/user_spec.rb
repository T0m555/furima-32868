require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it '同じメールアドレスでは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'メールアドレスに@がないと登録できない' do
      @user.email.sub!(/@/, '')
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it 'パスワードが空では登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'パスワードは6文字未満では登録できない' do
      @user.password = "123qw"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it 'パスワードは半角英数混合でないと登録できない' do
      @user.password = "111111"
      @user.password_confirmation = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it 'パスワードは2回入力されていないと登録できない' do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'パスワードと確認用パスワードが一致しないと登録できない' do
      @user.password = "123qwe"
      @user.password_confirmation = "234qwe"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'ユーザー本名は、名字が空であると登録できない' do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it 'ユーザー本名は、名前が空であると登録できない' do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'ユーザー名字は、全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.last_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid"
    end
    it 'ユーザー名前は、全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.first_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end
    it '名字のフリガナがないと登録できない' do
      @user.last_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last kana can't be blank"
    end
    it '名前のフリガナがないと登録できない' do
      @user.first_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First kana can't be blank"
    end
    it 'ユーザー本名のフリガナは、全角（カタカナ）でないと登録できない' do
      @user.last_kana = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last kana is invalid"
    end
    it 'ユーザー本名のフリガナは、全角（カタカナ）でないと登録できない' do
      @user.first_kana = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "First kana is invalid"
    end
    it '生年月日がないと登録できない' do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end




  # pending "add some examples to (or delete) #{__FILE__}"
end
