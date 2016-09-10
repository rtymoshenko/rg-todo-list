FactoryGirl.define do
  factory :project do
    sequence(:name) { |i| "pr_#{i}" }
    association(:user)
  end
end
