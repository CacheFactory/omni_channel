FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email {Faker::Internet.email}
    password '12345678'

    association :client
    after(:create) do |user, evaluator|
      user.client =  evaluator.client if  evaluator.client
      user.save
    end

  end

  
end 