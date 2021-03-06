require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '購入情報の保存' do
    before do
      @order_destination = FactoryBot.build(:order_destination)
    end

    context '商品が購入できる時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_destination).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @order_destination.building_name = nil
        expect(@order_destination).to be_valid
      end
    end
    
    
    context '商品が購入できない時' do
      it 'postal_codeが空では保存できないこと' do
        @order_destination.postal_code = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeに-が入ってないと保存できないこと' do
        @order_destination.postal_code = "1234567"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Postal code is invalid")
      end

      it 'prefecture_idが空では保存できないこと' do
        @order_destination.prefecture_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idの値が0では保存できないこと' do
        @order_destination.postal_code = 0
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Postal code is invalid")
      end

      it 'cityが空では保存できないこと' do
        @order_destination.city = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では保存できないこと' do
        @order_destination.address = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では保存できないこと' do
        @order_destination.phone_number = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberに-があると保存できないこと' do
        @order_destination.phone_number = "123-456-789"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが12文字以上では保存できないこと' do
        @order_destination.phone_number = "123456789012"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it "tokenが空では登録できないこと" do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end