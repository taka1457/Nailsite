FactoryBot.define do
  factory :post do
    body { Faker::Lorem.characters(number:140) }
    shop
  end
end