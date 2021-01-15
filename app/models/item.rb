class Item < ApplicationRecord
 
  validates :category_id, :condition_id, :shipping_date_id, :shipping_payer_id, :prefecture_id, numericality: { other_than: 1 }
  
  belongs_to :user 
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_payer
  belongs_to :shipping_date
  belongs_to :prefecture 
end
