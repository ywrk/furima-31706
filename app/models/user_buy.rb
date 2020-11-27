class UserBuy
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number,:item_id ,:user_id, :token

  with_options presence: true do
    validates :post_code      , format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-).Input herf-width numbers."}
    validates :city
    validates :address
    validates :phone_number   , format: {with: /\A[0-9]{11}\z/, message: "is invalid. Input herf-width numbers"}, length: { maximum: 11 }
    validates :prefecture_id  , numericality: { other_than: 1, message: "must be other than 1" }
    validates :token
    validates :user_id, numericality:{ only_integer: true }
    validates :item_id, numericality:{ only_integer: true }
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end