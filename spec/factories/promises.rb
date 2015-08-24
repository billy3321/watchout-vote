FactoryGirl.define do
  factory :promise do
    candidate { FactoryGirl.create(:candidate) }
    question { FactoryGirl.create(:question) }
    sequence(:answer)  { |n| "Promise Answer #{n}" }
    sequence(:summary)  { |n| "Promise Summary #{n}" }
    sequence(:detail)  { |n| "Promise Detail #{n}" }
    sequence(:date) { |n| n.days.ago }
    decision { ["agree", "disagree", "abstain", "notvote"].sample }
  end

end
