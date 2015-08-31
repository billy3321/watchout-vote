require "rails_helper"

describe "Vote" do

  let(:vote) { FactoryGirl.create(:vote) }

  describe "#show" do
    it "success" do
      get "/votes/#{vote.id}"
      expect(response).to be_success
    end

    it "success_with_clarify" do
      FactoryGirl.create :clarify, record: vote
      get "/votes/#{vote.id}"
      expect(response).to be_success
    end
  end

  describe "#clarify" do
    it "success" do
      get "/votes/#{vote.id}/clarify"
      expect(response).to be_success
    end
  end
end