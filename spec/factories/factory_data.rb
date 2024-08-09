FactoryBot.define do
  factory :task do
    task_name { Faker::Name.first_name }
    description  { Faker::Name.last_name }
  end
end