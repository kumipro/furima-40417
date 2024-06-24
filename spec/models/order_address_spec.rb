require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do

    context '内容に問題ない場合' do

      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
     end

    context '内容に問題がある場合' do

      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空だと保存できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeは3桁-4桁の半角文字列のみの正しい形式でないと保存できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'post_codeは全角を含むと保存できない' do
        @order_address.post_code = '123ー4567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'regionが空だと保存できない' do
        @order_address.region_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Region can't be blank")
      end
      it 'cityが空だと保存できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'block_numberが空だと保存できない' do
        @order_address.block_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block number can't be blank")
      end
      it 'phoneが空だと保存できない' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneは9桁以下の半角数値だと保存できない' do
        @order_address.phone = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneは12桁以上の半角数値だと保存できない' do
        @order_address.phone = '123456789123'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneは半角数字以外の文字を含むと保存できない' do
        @order_address.phone = '123-456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneは全角を含むと保存できない' do
        @order_address.phone = '123456789３'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end
      it 'userが紐付いていないと保存できない' do
        @order_address.user_id = nil      
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @order_address.item_id = nil      
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
