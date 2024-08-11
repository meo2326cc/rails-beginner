FactoryBot.define do
  factory :task do
    task_name { Faker::Lorem.word }
    description  { Faker::Lorem.sentence }
  end
end