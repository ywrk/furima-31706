class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_from
  belongs_to :shipping_fee
  belongs_to :estimated_shipping


  with_options presence: true do
    validates :image
    validates :title           , length: { maximum: 40 }
    validates :price           , numericality: { only_interger: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :description     , length: { maximum: 1000 }

    with_options numericality: { other_than: 1 } do
    validates :category_id     
    validates :condition_id    
    validates :shipping_from_id
    validates :shipping_fee_id  
    validates :estimated_shipping_id
    end
  end
end
