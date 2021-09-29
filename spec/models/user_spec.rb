require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '各項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do  
      it 'nicknameが空では登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない'do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it '名前が全角でないと登録できない' do
        @user.first_name = 'aaa'
        @user.family_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid", "Family name is invalid")
      end
      it 'お名前カナが全角でないと登録できない' do
        @user.first_name_kana = 'aaa'
        @user.family_name_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid", "Family name kana is invalid")
      end
      it '生年月日が空白では登録できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end 
  end   
end
