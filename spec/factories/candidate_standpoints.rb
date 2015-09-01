FactoryGirl.define do
  factory :candidate_standpoint do
    candidate { FactoryGirl.create(:candidate) }
    issue { FactoryGirl.create(:issue) }
    agree 15
    disagree 15
    abstain 15
    notvote 15
    unknown 15
    decision { ["agree", "disagree", "abstain", "notvote", "unknown"].sample }
  end

end
