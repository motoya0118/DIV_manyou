require 'faker'

User.create(
  email: 'puchan@gmail.com',
  password: 'abc',
  password_confirmation: 'abc',
  permission: true
)

10.times do
  User.create(
    email: Faker::Internet.email,
    password: 'abc',
    password_confirmation: 'abc',
    permission: false
  )

  LabelMaster.create(
    name: Faker::Games::Pokemon.name
  )
end

User.all.ids.each do |id|
  Task.create(
    title: Faker::Hobby.activity,
    content: Faker::Hobby.activity,
    user_id: id
  )
end

Task.all.ids.each do |task_id|
  LabelMaster.all.ids.each do |label_id|
    LabelChild.create(
      task_id: task_id,
      label_master_id: label_id
    )
  end
end
