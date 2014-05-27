# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :beacon do
    uuid Faker::Number.number(32)
    association :beacon_category
  end
end
