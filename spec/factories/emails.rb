FactoryGirl.define do
  factory :email do
    sequence(:email)  { |n| "test#{n}@test.com" }
    subscribed true
  end

end
