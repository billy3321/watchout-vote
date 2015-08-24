FactoryGirl.define do
  factory :constituency do
    sequence(:name)  { |n| "Constituency #{n}" }
    kind ""
  end

  factory :constituency_with_county, parent: :constituency do
    county { FactoryGirl.create(:county) }
  end
end
