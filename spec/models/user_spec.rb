require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end
    
    describe 'ユーザー新規登録' do
      it "nicknameとemailとpasswordとpassword_confirmationとfamily_nameとfairst_nameとfamily_name_kanaとfirst_name_kanaとbirth_dayが存在すれば登録できること" do
        expect(@user).to be_valid
      end
  
      it "nicknameが空では登録できないこと" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
  
      it "emailが空では登録できないこと" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
  
      it "passwordが空では登録できないこと" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
  
      it "password_confirmationが空では登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
  
      it "family_nameが空では登録できないこと" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
  
      it "first_nameが空では登録できないこと" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
  
      it "family_name_kanaが空だと登録できないこと" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
  
      it "first_name_kanaが空だと登録できないこと" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
  
      it "birth_dayが空だと登録できないこと" do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
  
      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
  
      it "emailに@が含まれてないと登録できないこと" do
        @user.email = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
  
      it "passwordが6文字以上だと登録できること" do
        @user.password = "a1a1a1"
        @user.password_confirmation = "a1a1a1"
        expect(@user).to be_valid
      end
  
      it "passwordが5文字以下だと登録できないこと" do
        @user.password = "a1a1a"
        @user.password_confirmation = "a1a1a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
  
      it "passwordが英文字のみだと登録できないこと" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
  
      it "passwordが数字のみだと登録できないこと" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
  
      it "passwordが半角ではないと登録できないこと" do
        @user.password = "ａ１ｉ１ｕ１ｅ１ｏ"
        @user.password_confirmation = "ａ１ｉ１ｕ１ｅ１ｏ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
  
      it "passwordとpassword_confirmationの値が一致しないと登録できないこと" do
      @user.password = "a1a1a1"
      @user.password_confirmation = "a2a2a2"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
  
      it "family_nameが半角だと登録できないこと" do
        @user.family_name = "ｶﾀｶﾅ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.")
      end
  
      it "first_nameが半角だと登録できないこと" do
        @user.first_name = "ｶﾀｶﾅ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
  
      it "family_name_kanaがカタカナ以外では登録できないこと" do
        @user.family_name_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid. Input full-width katakana characters.")
      end
  
      it "first_name_kanaがカタカナ以外では登録できないこと" do
        @user.first_name_kana = "ごんぞう"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
      end
  
      it "family_name_kanaが半角だと登録できないこと" do
        @user.family_name_kana = "ｶﾀｶﾅ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid. Input full-width katakana characters.")
      end
  
      it "first_name_kanaが半角だと登録できないこと" do
        @user.first_name_kana = "ｶﾀｶﾅ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
      end
    end
  
end
