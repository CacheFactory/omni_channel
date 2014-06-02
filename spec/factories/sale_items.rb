# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sale_item do
    name "MyString"
    description "MyText"
    price 1.5
    association :client

    after(:create) do |sale_item, evaluator|
      sale_item.client =  evaluator.client if  evaluator.client
      sale_item.save
    end
  end
end
