FactoryGirl.define do
  factory :user do
    provider 'email'
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }
  end
end
