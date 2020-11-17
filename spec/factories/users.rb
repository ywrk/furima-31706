FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'aaa111' }
    password_confirmation { password }
    first_name            { '小林' }
    last_name             { '賢太郎' }
    first_name_kana       { 'コバヤシ' }
    last_name_kana        { 'ケンタロウ' }
    birthday              { '1930-01-01' }
  end
end
