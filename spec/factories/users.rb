FactoryBot.define do
  factory :admin_user,class: User do
    email { "admin@aaa.com" }
    password { "1111" }
    password_confirmation { "1111" }
    permission { true }
  end
  factory :user do
    email { "user@aaa.com" }
    password { "1111" }
    password_confirmation { "1111" }
    permission { false }
  end
end
