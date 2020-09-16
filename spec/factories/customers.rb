FactoryBot.define do
  factory :customer do
    first_name { 'テスト' }
    last_name { '太郎' }
    first_name_kana { 'テスト' }
    last_name_kana { 'タロウ' }
    email { Faker::Internet.email }
    phone_number { 12345678909 }
    password { 'password' }
    password_confirmation { 'password' }
  end
end