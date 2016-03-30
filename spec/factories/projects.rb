FactoryGirl.define do
  factory :project do
    user
    title { Faker::Name.title }
  end
end
