FactoryBot.define do
  factory :user do
    email { "user#{rand(10000)}@example.com" }
    password { "password" }
    role { 'super_admin' }
  end
end
