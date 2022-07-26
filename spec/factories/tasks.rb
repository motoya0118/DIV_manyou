    # 「FactoryBotを使用します」という記述
FactoryBot.define do
  # 作成するテストデータの名前を「task」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :task do
    title { 'Factory' }
    content { 'Factory' }
    deadline {'2022-07-18'}
  end
  # 作成するテストデータの名前を「second_task」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :second_task, class: Task do
    title { 'Factoryで作ったデフォルトのタイトル２' }
    content { 'Factoryで作ったデフォルトのコンテント２' }
  end

  factory :label_task, class: Task do
    trait :with_label do
      title { 'Factoryで作ったデフォルトのタイトル２' }
      content { 'Factoryで作ったデフォルトのコンテント２' }
      user { User.first}
      after(:build) do |task|
        task.labels << FactoryBot.build(:label_master, :with_label_master)
      end
    end
  end

  factory :label_task2, class: Task do
    trait :with_label2 do
      title { 'Factoryで作ったデフォルトのタイトル２' }
      content { 'Factoryで作ったデフォルトのコンテント２' }
      user { User.first}
      after(:build) do |task|
        task.labels << FactoryBot.build(:label_master2, :with_label_master2)
      end
    end

  end

end
