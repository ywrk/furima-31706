FactoryBot.define do
  factory :user_buy do
    post_code             { "111-1111" }
    prefecture_id         { 2 }
    city                  { "猫市" }
    address               { "猫町" }
    phone_number          { "09011112222" }
    user_id               { 1 }
    item_id               { 1 }
    token                 { 11111111111 }
  end
end