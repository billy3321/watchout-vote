require "rails_helper"

describe "Party" do

  let(:party) { FactoryGirl.create(:party) }

  describe "#show" do
    it "success" do
      get "/parties/#{party.id}"
      expect(response).to be_success
    end
  end

  describe "#issues" do
    it "success" do
      get "/parties/#{party.id}/issues"
      expect(response).to be_success
    end

    it "success_with_party_standpoints" do
      3.times { FactoryGirl.create :party_standpoint, party: party }
      get "/parties/#{party.id}/issues"
      expect(response).to be_success
    end
  end

  describe "#issue" do
    it "success" do
      issue = FactoryGirl.create :issue
      party_standpoint = FactoryGirl.create :party_standpoint, party: party, issue: issue
      get "/parties/#{party.id}/issues/#{issue.id}"
      expect(response).to be_success
    end
  end

  describe "#bills" do
    it "success" do
      issue = FactoryGirl.create :issue
      party_standpoint = FactoryGirl.create :party_standpoint, party: party, issue: issue
      get "/parties/#{party.id}/issues/#{issue.id}/bills"
      expect(response).to be_success
    end

    it "success_without_standpoint" do
      issue = FactoryGirl.create :issue
      get "/parties/#{party.id}/issues/#{issue.id}/bills"
      expect(response).to be_success
    end

    it "success_with_bills" do
      issue = FactoryGirl.create :issue
      party_standpoint = FactoryGirl.create :party_standpoint, party: party, issue: issue
      3.times do
        candidate = FactoryGirl.create :candidate
        3.times { FactoryGirl.create :bill, candidate: candidate, issue: issue }
      end
      get "/parties/#{party.id}/issues/#{issue.id}/bills"
      expect(response).to be_success
    end
  end

  describe "#interpellations" do
    it "success" do
      issue = FactoryGirl.create :issue
      party_standpoint = FactoryGirl.create :party_standpoint, party: party, issue: issue
      get "/parties/#{party.id}/issues/#{issue.id}/interpellations"
      expect(response).to be_success
    end

    it "success_without_standpoint" do
      issue = FactoryGirl.create :issue
      get "/parties/#{party.id}/issues/#{issue.id}/interpellations"
      expect(response).to be_success
    end

    it "success_with_interpellations" do
      issue = FactoryGirl.create :issue
      party_standpoint = FactoryGirl.create :party_standpoint, party: party, issue: issue
      3.times do
        candidate = FactoryGirl.create :candidate
        3.times { FactoryGirl.create :interpellation, candidate: candidate, issue: issue }
      end
      get "/parties/#{party.id}/issues/#{issue.id}/interpellations"
      expect(response).to be_success
    end
  end

  describe "#votes" do
    it "success" do
      issue = FactoryGirl.create :issue
      party_standpoint = FactoryGirl.create :party_standpoint, party: party, issue: issue
      get "/parties/#{party.id}/issues/#{issue.id}/votes"
      expect(response).to be_success
    end

    it "success_without_standpoint" do
      issue = FactoryGirl.create :issue
      get "/parties/#{party.id}/issues/#{issue.id}/votes"
      expect(response).to be_success
    end

    it "success_with_votes" do
      issue = FactoryGirl.create :issue
      party_standpoint = FactoryGirl.create :party_standpoint, party: party, issue: issue
      3.times do
        candidate = FactoryGirl.create :candidate
        3.times { FactoryGirl.create :vote, candidate: candidate, issue: issue }
      end
      get "/parties/#{party.id}/issues/#{issue.id}/votes"
      expect(response).to be_success
    end
  end
end
