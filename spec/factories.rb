FactoryGirl.define do
  factory :user do
    name     "Mark M"
    email    "mark@test.com"
    password "foobar"
    password_confirmation "foobar"
  end
end