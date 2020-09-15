FactoryBot.define do
  factory :menu do
    name { Faker::Lorem.characters(number:10) }
    detail { Faker::Lorem.characters(number:10) }
    price { '10' }
  end
end