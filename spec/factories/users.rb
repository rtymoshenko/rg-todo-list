# This will guess the User class
FactoryGirl.define do
  factory :user do
    id 1
    email "user1@test.ru"
    encrypted_password "abcdef1"
  end
end
