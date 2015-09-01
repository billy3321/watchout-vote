FactoryGirl.define do
  factory :interpellation do
    candidate { FactoryGirl.create(:candidate) }
    committee { FactoryGirl.create(:committee) }
    issue { FactoryGirl.create(:issue) }
    sequence(:content)  { |n| "Interpellation Content #{n}" }
    sequence(:summary)  { |n| "Interpellation Summary #{n}" }
    sequence(:detail)  { |n| "Interpellation Detail #{n}" }
    sequence(:date) { |n| n.days.ago }
    decision { ["agree", "disagree", "abstain", "notvote", "unknown"].sample }
    url "http://www.google.com"
  end

  factory :interpellation_with_clarify, parent: :interpellation do
    after(:build) do |interpellation|
      interpellation.clarify= build(:clarify, record: interpellation)
    end

    after(:create) do |interpellation|
      interpellation.clarify.save!
    end
  end

end
