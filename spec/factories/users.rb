FactoryBot.define do
  factory :user do
    username { "MrTest" }
    email { "test@testing.com" }
    password { "password1" }
    password_confirmation { "password1" }
  end
end
