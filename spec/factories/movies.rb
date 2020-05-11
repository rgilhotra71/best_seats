FactoryGirl.define do
  factory :movie do
    title { Faker::Lorem.word }
    summary { Faker::Lorem.sentence }
    year { Time.now.year }
    genre { Faker::Hacker.adjective }
    rows { Faker::Number.within(range: 1..10) }
    columns {Faker::Number.within(range: 10..20)}
  end
end