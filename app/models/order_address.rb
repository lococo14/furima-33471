class OrderAddress
  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture_id, :city, :street_name, :building_name, :phone_number, :user_id, :item_id, :order_id,
                :token

  with_options presence: true do
    validates :zip_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Input proper zip code' }
    validates   :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates   :city
    validates   :street_name
    validates   :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only with valid numbers' }
    validates   :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, street_name: street_name,
                           building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
