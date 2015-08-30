require "rails_helper"

describe "Bill" do

  let(:bill) { FactoryGirl.create(:bill) }

  describe "#show" do
    it "success" do
      get "/bills/#{bill.id}"
      expect(response).to be_success
    end

    it "success_with_clarify" do
      FactoryGirl.create :clarify, record: bill
      get "/bills/#{bill.id}"
      expect(response).to be_success
    end
  end
end
