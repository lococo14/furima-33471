class OrderAddress
  include ActiveModel::Model 
  attr_accessor :zip_code,:prefecture_id,:city, :street_name,:building_name,:phone_number
  

  with_options presence: true do 
   validates   :zip_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Input proper zip code' }
   validates   :prefecture_id,  numericality: { other_than: 0, message: "can't be blank" }
   validates   :city
   validates   :street_name
   validates   :phone_number, format: { with: /^\d{10,11}$/ , message: 'is invalid. Input with only numbers'}
  end 
  
  def save
    user = User.create(nickname :nickname, last_name :last_name, first_name :first_name, last_name_kana :last_name_kana, first_name_kana :first_name_kana, birthday :birthday, password :password)
    item = Item.create(item_name :item_name, description :description, price :price, image :image, category_id :category_id, condition_id :condition_id, prefecture_id :prefecture_id, shipping_payer_id :shipping_payer_id, shipping_date_id :shipping_date_id)
    Order.create(user_id :user.id, item_id :item.id)
    ShippingAddress.create(zip_code :zip_code, prefecture_id :prefecture_id, city :city, street_name :street_name, building_name :building_name,phone_number :phone_number,order_id :order.id )
  end  

end 
