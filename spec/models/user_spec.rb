require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do

    context '内容に問題ない場合' do
      it 'すべての情報が正しく入力されていれば保存できること' do
      expect(@user).to be_valid  
      end
    end

    context '内容に問題がある場合' do
     it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it '重複したemailでは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
     end
     it 'emailに@がないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
     end  
     it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it 'passwordが5文字以下では登録できない' do
      @user.password = 'abc12'
      @user.password_confirmation = 'abc12'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end
     it 'passwordは半角数字だけでは登録できない' do
      @user.password = '123456'      
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters.")
     end
     it 'passwordは半角英語だけでは登録できない' do
      @user.password = 'abcdef'      
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters.")
     end
     it 'passwordは全角文字を含むと登録できない' do
      @user.password = 'AＢc123'      
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters.")
     end
     it 'passwordとpassword(確認)は一致してないと登録できない' do
      @user.password = 'abc123'
      @user.password = 'abc1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
     end
     it 'last_nameが全角でないと登録できない' do
      @user.last_name = 'ｻﾄｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
     end
     it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
     end
     it 'first_nameが全角でないと登録できない' do
      @user.first_name = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
     end
     it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
     end
     it 'last_name_kanaが全角カタカナでないと登録できない' do
      @user.last_name_kana = 'ｻﾄｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
     end
     it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
     end
     it 'first_name_kanaが全角カタカナでないと登録できない' do
      @user.first_name_kana = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
     end
     it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
   end
  end
end
