require "rails_helper"

describe "Issue" do

  let(:issue) { FactoryGirl.create(:issue) }

  describe "#show" do
    it "success" do
      get "/issues/#{issue.id}"
      expect(response).to be_success
    end

    it "success_with_slides" do
      3.times { FactoryGirl.create :slide, issue: issue }
      get "/issues/#{issue.id}"
      expect(response).to be_success
    end

    it "success_with_party_standpoints" do
      3.times { FactoryGirl.create :party_standpoint, issue: issue, decision: "agree" }
      3.times { FactoryGirl.create :party_standpoint, issue: issue, decision: "disagree" }
      3.times { FactoryGirl.create :party_standpoint, issue: issue, decision: "abstain" }
      3.times { FactoryGirl.create :party_standpoint, issue: issue, decision: "notvote" }
      get "/issues/#{issue.id}"
      expect(response).to be_success
    end

    it "success_with_candidate_standpoints" do
      3.times { FactoryGirl.create :candidate_standpoint, issue: issue, decision: "agree" }
      3.times { FactoryGirl.create :candidate_standpoint, issue: issue, decision: "disagree" }
      3.times { FactoryGirl.create :candidate_standpoint, issue: issue, decision: "abstain" }
      3.times { FactoryGirl.create :candidate_standpoint, issue: issue, decision: "notvote" }
      get "/issues/#{issue.id}"
      expect(response).to be_success
    end
  end
end
