# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sale_item do
    name "MyString"
    description "MyText"
    price 1.5
    association :client
  end
end
