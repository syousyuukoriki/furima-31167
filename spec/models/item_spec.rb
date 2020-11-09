require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end


    it "item_nameとintroductionとcategory_idとitem_condition_idとpriceとshipping_cost_idとarea_idとdays_idとimageが存在すれば保存できる" do
      expect(@item).to be_valid
    end

    it "item_nameが空では保存できないこと" do
      @item.item_name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end

    it "introductionが空では保存できないこと" do
      @item.introduction = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Introduction can't be blank")
    end

    it "category_idが空では保存できないこと" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it  "item_condition_idが空では保存できないこと" do
      @item.item_condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item condition can't be blank")
    end

    it  "priceが空では保存できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "shipping_cost_idが空では保存できないこと" do
      @item.shipping_cost_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
    end

    it "area_idが空では保存できないこと" do
      @item.area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end

    it "days_idが空では保存できないこと" do
      @item.days_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Days can't be blank")
    end

    it "imageが空では保存できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "priceの値がが300以下では保存できないこと" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "priceの値が9999999以上だと保存できないこと" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it "userが紐づいてないと保存できないこと" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end
