class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string      :zip_code,     null: false
      t.string      :city,     null: false
      t.string      :street_name,     null: false
      t.string      :phone_number,     null: false
      t.string      :building_name
      t.integer     :prefecture_id,    null: false
      t.references  :order,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
