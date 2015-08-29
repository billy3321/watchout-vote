FactoryGirl.define do
  factory :party_standpoint do
    party { FactoryGirl.create(:party) }
    issue { FactoryGirl.create(:issue) }
    agree 15
    disagree 15
    abstain 15
    notvote 15
    decision { ["agree", "disagree", "abstain", "notvote"].sample }
  end

end
