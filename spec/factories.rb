FactoryGirl.define do

  factory :user do
    password "foobar"
    email { "user3@example.com" }
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