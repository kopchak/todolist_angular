FactoryGirl.define do
  factory :task do
    project
    title { Faker::Name.title }
    deadline { '2016-03-30' }
    status { 'false' }
  end
end
