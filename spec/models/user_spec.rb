require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname、email、password、password_confirmation、firstname、lastname、firstname_furigana、lastname_furigana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上で半角英数字混合であれば登録できる' do
        @user.password = '000aaa'
        @user.password_confirmation = '000aaa'
        expect(@user).to be_valid
      end
      it 'firstnameとlastnameが全角であれば登録できる' do
        @user.firstname = '全角'
        @user.lastname = '全角'
        expect(@user).to be_valid
      end
      it 'firstname_furiganaとlastname_furiganaが全角（カタカナ）であれば登録できる' do
        @user.firstname_furigana = 'ゼンカク'
        @user.lastname_furigana = 'ゼンカク'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
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
      it 'emailは、＠を含まないと登録できない' do
        @user.email = 'hogehuga.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは確認用と値が一致しないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは半角数字のみでは登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'firstnameとlastnameがそれぞれ空では登録できない' do
        @user.firstname = ''
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank", 'Firstname is invalid',
                                                      "Lastname can't be blank", 'Lastname is invalid')
      end
      it 'firstnameは全角でないと登録できない' do
        @user.firstname = 'hannkaku'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname is invalid')
      end
      it 'lastnameは全角でないと登録できない' do
        @user.lastname = 'hannkaku'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname is invalid')
      end
      it 'firstname_furiganaが空では登録できない' do
        @user.firstname_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname furigana can't be blank", 'Firstname furigana is invalid')
      end
      it 'lastname_furiganaが空では登録できない' do
        @user.lastname_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname furigana can't be blank", 'Lastname furigana is invalid')
      end
      it 'firstname_furiganaが全角（カタカナ）でないと登録できない' do
        @user.firstname_furigana = 'katakana'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname furigana is invalid')
      end
      it 'lastname_furiganaが全角（カタカナ）でないと登録できない' do
        @user.lastname_furigana = 'katakana'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname furigana is invalid')
      end
      it 'firstname_furiganaがカタカナ以外の全角文字だと登録できないこと' do
        @user.firstname_furigana = 'かたかな'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname furigana is invalid')
      end
      it 'lastname_furiganaがカタカナ以外の全角文字だと登録できないこと' do
        @user.lastname_furigana = 'かたかな'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname furigana is invalid')
      end
    end
  end
end
