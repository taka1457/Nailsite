FactoryBot.define do
  factory :post_comment do
    body { Faker::Lorem.characters(number:10) }
  end
end