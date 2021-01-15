require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品機能' do
    before do
    @item = FactoryBot.build(:item)
    end
   
  it '全ての値が正しく入力されていれば出品ができること' do
    expect(@item).to be_valid
  end
  it 'imageが空では出品できないこと' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end
  it 'descriptionが空では出品できないこと' do
    @item.description = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Description can't be blank")
  end
  it 'item_nameが空では出品できないこと' do
    @item.item_name = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Item name can't be blank")
  end
  it 'category_idが空では出品できないこと' do
    @item.category_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end
  it 'condition_idが空では出品できないこと' do
    @item.condition_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition can't be blank")
  end
  it 'shipping_payer_idが空では出品できないこと' do
    @item.shipping_payer_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping payer can't be blank")
  end
  it 'prefecture_idが空では出品できないこと' do
    @item.prefecture_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture can't be blank")
  end
  it 'shipping_date_idが空では出品できないこと' do
    @item.shipping_date_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping date can't be blank")
  end  
  it 'priceが空では出品できないこと' do
    @item.price = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end
  it 'priceが299円以下では出品できないこと' do
    @item.price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is out of setting range")
  end
  it 'priceが10000000円以上では出品できないこと' do
    @item.price = 10000000
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is out of setting range")
  end
  it 'priceが半角数字でなくては出品できないこと ' do
    @item.price = "３００"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is invalid. Input half-width number.")
  end  
 end 
end
