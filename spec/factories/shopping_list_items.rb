# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shopping_list_item do
    name "MyString"
    association :user
  end
end
