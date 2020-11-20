class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :image                
    validates :title                , length: {maximum: 40 }  #40文字まで
    validates :price                , numericality: {:only_interger => true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 } #半角英数¥300~¥9,999,999の間であること
    validates :description          , length: {maximum: 1000 } #1000文字まで
    validates :category_id          , numericality: { other_than: 1 } 
    validates :condition_id         , numericality: { other_than: 1 } 
    validates :shipping_from_id     , numericality: { other_than: 1 } 
    validates :shipping_fee_id      , numericality: { other_than: 1 } 
    validates :estimated_shipping_id, numericality: { other_than: 1 } 
  end


end
