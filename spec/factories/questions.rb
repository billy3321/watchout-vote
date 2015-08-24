FactoryGirl.define do
  factory :question do
    sequence(:title)  { |n| "Question #{n}" }
    sequence(:description)  { |n| "Question Description #{n}" }
    sequence(:content)  { |n| "Question Content#{n}" }
    issue { FactoryGirl.create(:issue) }
  end
end
