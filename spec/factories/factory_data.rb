FactoryBot.define do
  factory :task do
    task_name { Faker::Lorem.word }
    description  { Faker::Lorem.sentence }

    factory :task_with_time do
      task_name { Faker::Lorem.word  }
      description  { Faker::Lorem.sentence }
      date { Date.today + Faker::Number.non_zero_digit }
    end

    factory :empty_task do
      task_name { "" }
      description  { "" }
    end
  end
end