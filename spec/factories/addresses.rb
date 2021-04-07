FactoryBot.define do
  factory :address do
    post_number   {'123-1234'}
    prefecture_id {3}
    municipality  {'◯×市'}
    address       {'どこか'}
    building_name {''}
    phone_number  {'000-0000-0000'}
  end
end
