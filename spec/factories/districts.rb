FactoryGirl.define do
  factory :district do
    constituency { FactoryGirl.create(:constituency) }
    sequence(:name)  { |n| "District #{n}" }
  end
end
