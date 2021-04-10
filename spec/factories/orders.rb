FactoryBot.define do
  factory :order do
    post_number   {Faker::Number.number(digits: 3).to_s + "-" + Faker::Number.number(digits: 4).to_s}
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    municipality  {Faker::Address.city}
    address       {Faker::Address.street_address}
    building_name {Faker::Beer.hop}
    phone_number  {Faker::Number.number(digits: 11)}
    item_id {1}
    user_id {1}
    token {"tok.................."}
    
  end
end
