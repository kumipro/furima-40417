require 'rails_helper'

RSpec.describe Item, type: :model do
   before do
    @item = FactoryBot.build(:item)
  end


  describe '商品出品機能' do

    context '内容に問題ない場合' do
      it 'すべての情報が正しく入力されていれば保存できること' do
      expect(@item).to be_valid  
      end
    end

    context '内容に問題がある場合' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
       end
      it 'titleが空では登録できない' do
       @item.title = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'reviewが空では登録できない' do
       @item.review = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Review can't be blank")
      end
      it 'categoryが空では登録できない' do
       @item.category_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'conditionが空では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
       end
      it 'shippingが空では登録できない' do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
       end
      it 'regionが空では登録できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
       end
      it 'shipping_dateが空では登録できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
       end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
       end
       it 'priceは全角文字を含むと登録できない' do
        @item.price = '３０００'     
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
       end
       it 'priceは半角英文字を含むと登録できない' do
        @item.price = '500i'      
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
       end
       it 'priceは¥299以下は登録できない' do
        @item.price = 299      
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
       end
       it 'priceは¥9,999,999以上は登録できない' do
        @item.price = 10000000      
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
       end
     end
   end
end
