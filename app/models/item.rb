class Item < ApplicationRecord

  with_options presence: true do 
    validates :item_name
    validates :description
    validates :price
    validates :user
    validates :image 
  with_options numericality: { other_than: 1 } do 
    validates :category_id    
    validates :condition_id
    validates :shipping_date_id
    validates :shipping_payer_id
    validates :prefecture_id
  end 
end  

  belongs_to :user 
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_payer
  belongs_to :shipping_date
  belongs_to :prefecture 
end
