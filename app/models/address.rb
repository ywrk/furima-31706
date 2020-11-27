class Address < ApplicationRecord
  belongs_to :purchase

  with_options presence: true do
    validates :post_code
    validates :city
    validates :address
    validates :phone_number
    validates :prefecture_id
  end
  # validates :building_name
end
