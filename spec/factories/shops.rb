FactoryBot.define do
    factory :shop do
      name { 'nailsalon' }
      email { Faker::Internet.email }
      phone_number { 12345678909 }
      postal_code { 1000006 }
      prefecture_code { '東京都' }
      city { '千代田区有楽町' }
      street { '２丁目' }
      traffic_method { Faker::Lorem.characters(number:10) }
      business_hours { Faker::Lorem.characters(number:10) }
      budget { Faker::Lorem.characters(number:10) }
      payment_method { Faker::Lorem.characters(number:10) }
      seat { Faker::Lorem.characters(number:10) }
      staff { Faker::Lorem.characters(number:10) }
      parking { Faker::Lorem.characters(number:10) }
      promotion { Faker::Lorem.characters(number:10) }
      introduction { Faker::Lorem.characters(number:20) }
      genre
      password { 'password' }
      password_confirmation { 'password' }
    end
  end