require "rails_helper"

describe "Candidate" do

  let(:candidate) { FactoryGirl.create(:candidate) }

  describe "#show" do
    it "success" do
      get "/candidates/#{candidate.id}"
      expect(response).to be_success
    end
  end

  describe "#issues" do
    it "success" do
      get "/candidates/#{candidate.id}/issues"
      expect(response).to be_success
    end

    it "success_with_candidate_standpoints" do
      3.times { FactoryGirl.create :candidate_standpoint, candidate: candidate }
      get "/candidates/#{candidate.id}/issues"
      expect(response).to be_success
    end
  end

  describe "#issue" do
    it "success" do
      issue = FactoryGirl.create :issue
      candidate_standpoint = FactoryGirl.create :candidate_standpoint, candidate: candidate, issue: issue
      get "/candidates/#{candidate.id}/issues/#{issue.id}"
      expect(response).to be_success
    end
  end

  describe "#bills" do
    it "success" do
      issue = FactoryGirl.create :issue
      candidate_standpoint = FactoryGirl.create :candidate_standpoint, candidate: candidate, issue: issue
      get "/candidates/#{candidate.id}/issues/#{issue.id}/bills"
      expect(response).to be_success
    end

    it "success_without_standpoint" do
      issue = FactoryGirl.create :issue
      get "/candidates/#{candidate.id}/issues/#{issue.id}/bills"
      expect(response).to be_success
    end

    it "success_with_bills" do
      issue = FactoryGirl.create :issue
      candidate_standpoint = FactoryGirl.create :candidate_standpoint, candidate: candidate, issue: issue
      3.times do
        candidate = FactoryGirl.create :candidate
        3.times { FactoryGirl.create :bill, candidate: candidate, issue: issue }
      end
      get "/candidates/#{candidate.id}/issues/#{issue.id}/bills"
      expect(response).to be_success
    end
  end

  describe "#interpellations" do
    it "success" do
      issue = FactoryGirl.create :issue
      candidate_standpoint = FactoryGirl.create :candidate_standpoint, candidate: candidate, issue: issue
      get "/candidates/#{candidate.id}/issues/#{issue.id}/interpellations"
      expect(response).to be_success
    end

    it "success_without_standpoint" do
      issue = FactoryGirl.create :issue
      get "/candidates/#{candidate.id}/issues/#{issue.id}/interpellations"
      expect(response).to be_success
    end

    it "success_with_interpellations" do
      issue = FactoryGirl.create :issue
      candidate_standpoint = FactoryGirl.create :candidate_standpoint, candidate: candidate, issue: issue
      3.times do
        candidate = FactoryGirl.create :candidate
        3.times { FactoryGirl.create :interpellation, candidate: candidate, issue: issue }
      end
      get "/candidates/#{candidate.id}/issues/#{issue.id}/interpellations"
      expect(response).to be_success
    end
  end

  describe "#votes" do
    it "success" do
      issue = FactoryGirl.create :issue
      candidate_standpoint = FactoryGirl.create :candidate_standpoint, candidate: candidate, issue: issue
      get "/candidates/#{candidate.id}/issues/#{issue.id}/votes"
      expect(response).to be_success
    end

    it "success_without_standpoint" do
      issue = FactoryGirl.create :issue
      get "/candidates/#{candidate.id}/issues/#{issue.id}/votes"
      expect(response).to be_success
    end

    it "success_with_votes" do
      issue = FactoryGirl.create :issue
      candidate_standpoint = FactoryGirl.create :candidate_standpoint, candidate: candidate, issue: issue
      3.times do
        candidate = FactoryGirl.create :candidate
        3.times { FactoryGirl.create :vote, candidate: candidate, issue: issue }
      end
      get "/candidates/#{candidate.id}/issues/#{issue.id}/votes"
      expect(response).to be_success
    end
  end
end
