FactoryGirl.define do
  factory :vote do
    candidate { FactoryGirl.create(:candidate) }
    committee { FactoryGirl.create(:committee) }
    issue { FactoryGirl.create(:issue) }
    sequence(:content)  { |n| "Vote Content #{n}" }
    sequence(:summary)  { |n| "Vote Summary #{n}" }
    sequence(:detail)  { |n| "Vote Detail #{n}" }
    sequence(:date) { |n| n.days.ago }
    decision { ["agree", "disagree", "abstain", "notvote"].sample }
    url "http://www.google.com"
  end

  factory :vote_with_clarify, parent: :vote do
    after(:build) do |vote|
      vote.clarify = build(:clarify, record: vote)
    end

    after(:create) do |vote|
      vote.clarify.save!
    end
  end

end
