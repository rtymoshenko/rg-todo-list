# This will guess the User class
FactoryGirl.define do
  factory :user do
    sequence(:id) { |n| n }
    sequence(:email) { |n| "user#{n}@test.ru" }
    encrypted_password "abcdef1"
    password "romantrv"
    password_confirmation "romantrv"
  end
end
