FactoryGirl.define do

  factory :user do
    first_name Faker::Name.unique.name
    last_name Faker::Name.unique.name
    email Faker::Internet.email
    password "foobar"
  end

  factory :assignment do
    name "Foo"
   end

  factory :question do
    name "Foo"
   end

  factory :answer do
    name "Foo"
   end

end