FactoryGirl.define do
  factory :project do
    user
    title { Faker::Lorem.word }
  end
end
