require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入機能' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    
     context '商品の購入ができるとき' do
       it '必要な値が全て入力されていれば購入できること' do
       expect(@order_address).to be_valid
       end
       it 'building_nameは空でも購入できること' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
       end
     end
     
     context '商品の購入ができないとき' do
       it 'zip_codeが空では購入できないこと' do
        @order_address.zip_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code can't be blank")
       end
       it 'prefectureが空では購入できないこと' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
       end
       it 'cityが空では購入できないこと' do 
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
       end
       it 'street_nameが空では購入できないこと' do
        @order_address.street_name = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street name can't be blank")
       end
       it 'phone_numberが空では購入できないこと' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
       end
       it 'zip_codeにハイフンがないと購入できないこと'do
       @order_address.zip_code = "1234567"
       @order_address.valid?
       expect(@order_address.errors.full_messages).to include("Zip code is invalid. Input proper zip code")
       end
       it 'phone_numberにハイフンを入れると購入できないこと' do
        @order_address.phone_number = "03-123-4567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input only with valid numbers")
       end
       it 'phone_numberが11桁以上だと購入できないこと' do 
        @order_address.phone_number = "090123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input only with valid numbers")
       end
       it 'tokenが空では購入できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
       end 
     end
   end
end
