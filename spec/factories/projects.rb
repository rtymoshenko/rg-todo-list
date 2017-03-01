FactoryGirl.define do
  factory :project do |f|
    f.sequence(:id) { |id| id }
    f.sequence(:name) { |n| "MyProject##{n}" }
    f.user_id 1
  end
end

