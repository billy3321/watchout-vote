FactoryGirl.define do
  factory :email do
    sequence(:email)  { |n| "test#{n}@test.com" }
  end

end
