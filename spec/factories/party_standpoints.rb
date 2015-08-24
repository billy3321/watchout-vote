FactoryGirl.define do
  factory :party_standpoint do
    party { FactoryGirl.create(:party) }
    issue { FactoryGirl.create(:issue) }
    agree 1.5
    disagree 1.5
    abstain 1.5
    notvote 1.5
  end

end
