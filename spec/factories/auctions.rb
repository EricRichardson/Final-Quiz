FactoryGirl.define do
  factory :auction do
    title { Faker::Hacker.noun }
    details { Faker::Hipster.paragraph }
    end_time { 3.days.from_now }
    reserve_price { rand(1000) + 10 }
  end
end
