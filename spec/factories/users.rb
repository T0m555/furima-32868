FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    last_name             { Gimei.last.kanji }
    first_name            { Gimei.first.kanji }
    last_kana             { Gimei.last.katakana }
    first_kana            { Gimei.first.katakana }
    birthday              { '1990-01-01' }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end
