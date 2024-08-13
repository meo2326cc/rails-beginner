FactoryBot.define do
  factory :task do
    task_name { Faker::Lorem.word }
    description  { Faker::Lorem.sentence }

    factory :empty_task do
      task_name { "" }
      description  { "" }
    end
  end
end