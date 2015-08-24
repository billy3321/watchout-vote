FactoryGirl.define do
  factory :bill do
    candidate { FactoryGirl.create(:candidate) }
    issue { FactoryGirl.create(:issue) }
    sequence(:content)  { |n| "Bill Content #{n}" }
    sequence(:summary)  { |n| "Bill Summary #{n}" }
    sequence(:detail)  { |n| "Bill Detail #{n}" }
    sequence(:date) { |n| n.days.ago }
    decision { ["agree", "disagree", "abstain", "notvote"].sample }
    url "http://www.google.com"
  end

  factory :bill_with_clarify, parent: :bill do
    after(:build) do |bill|
      bill.clarify = build(:clarify, record: bill)
    end

    after(:create) do |bill|
      bill.clarify.save!
    end
  end
end
