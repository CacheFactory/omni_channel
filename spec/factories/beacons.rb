# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :beacon do
    name 'bla'
    factory_id '123'
    association :beacon_category
    association :client
    
  end
end
