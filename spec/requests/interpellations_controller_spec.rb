require "rails_helper"

describe "Interpellation" do

  let(:interpellation) { FactoryGirl.create(:interpellation) }

  describe "#show" do
    it "success" do
      get "/interpellations/#{interpellation.id}"
      expect(response).to be_success
    end

    it "success_with_clarify" do
      FactoryGirl.create :clarify, record: interpellation
      get "/interpellations/#{interpellation.id}"
      expect(response).to be_success
    end
  end
end