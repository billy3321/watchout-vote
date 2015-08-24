FactoryGirl.define do
  factory :candidate_standpoint do
    candidate { FactoryGirl.create(:candidate) }
    issue { FactoryGirl.create(:issue) }
    agree 1.5
    disagree 1.5
    abstain 1.5
    notvote 1.5
  end

end
