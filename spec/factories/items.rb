FactoryBot.define do
  factory :item do
    name                {Faker::Lorem.sentence}
    description         {Faker::Lorem.sentence}
    category_id         {Faker::Number.between(from:2, to:14)}
    condition_id        {Faker::Number.between(from:2, to:7)}
    shippingCharge_id   {Faker::Number.between(from:2, to:3)}
    prefecture_id       {Faker::Number.between(from:2, to:48)}
    daysToShip_id       {Faker::Number.between(from:2, to:4)}
    price               {Faker::Number.between(from:300, to:9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_pic.png'), filename: 'test_pic.png')
    end
  end
end
