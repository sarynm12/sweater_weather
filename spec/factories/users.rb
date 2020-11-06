FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password_digest { 'password123' }
  end
end
