FactoryGirl.define do
  factory :project do |p|
    p.sequence(:id) { |id| id }
    p.sequence(:name) { |n| "MyProject##{n}" }
    user_id 1
  end
end

