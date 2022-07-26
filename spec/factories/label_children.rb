FactoryBot.define do
  factory :label_child do
    association :label_master
    association :task
  end
end
