FactoryGirl.define do
  factory :clarify do
    sequence(:content)  { |n| "Clarify Content#{n}" }
    sequence(:date) { |n| n.days.ago }
  end

  factory :bill_clarify, parent: :clarify do
    record { FactoryGirl.create(:bill) }
  end

  factory :interpellation_clarify, parent: :clarify do
    record { FactoryGirl.create(:interpellation) }
  end

  factory :vote_clarify, parent: :clarify do
    record { FactoryGirl.create(:vote) }
  end
end
