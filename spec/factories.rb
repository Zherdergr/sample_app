FactoryGirl.define do
  factory :user do
    name     "Test Name"
    email    "test@test.com"
    password "foobar123"
    password_confirmation "foobar123"
  
  end
end