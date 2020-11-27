FactoryBot.define do
  factory :item do
    title                 { Faker::Lorem.characters(number: 10) }
    price                 { 12_500 }
    description           { Faker::Lorem.characters(number: 100) }
    category_id           { 2 }
    condition_id          { 2 }
    shipping_from_id      { 2 }
    shipping_fee_id       { 2 }
    estimated_shipping_id { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
