FactoryGirl.define do
  factory :task do
    name "task1"
    association(:project)
  end
end
