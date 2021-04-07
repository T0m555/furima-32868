FactoryBot.define do
  factory :payment do
    association :item
    association :user
  end
end
