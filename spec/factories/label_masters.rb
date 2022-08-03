FactoryBot.define do
  factory :make_label, class: LabelMaster do
    name {'ラベル名'}
  end

  factory :label_master, class: LabelMaster do
    trait :with_label_master do
      name {'ラベル名'}
      after(:build) do |label|
        label.label_childs = FactoryBot.build_list(:label_child, 1)
      end
    end
  end

  factory :label_master2, class: LabelMaster do
    trait :with_label_master2 do
      name {'仮ラベル'}
      after(:build) do |label|
        label.label_childs = FactoryBot.build_list(:label_child, 1)
      end
    end
  end
end
