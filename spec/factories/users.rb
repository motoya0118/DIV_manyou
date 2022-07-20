FactoryBot.define do
  factory :user do
    email { "MyString" }
    password_digest { "MyString" }
    permission { false }
  end
end
