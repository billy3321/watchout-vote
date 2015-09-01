require "rails_helper"

describe "Email" do

  let(:email) { FactoryGirl.create(:email) }
  let(:new_email) do
    {
      email: "spec_test@test.com"
    }
  end

  describe "#create" do
    it "success" do
      expect {
        post "/emails", email: new_email
      }.to change { Email.count }.by(1)
    end

    it "duplicate not create" do
      post "/emails", email: new_email
      expect {
        post "/emails", email: new_email
      }.to change { Email.count }.by(0)
    end

    it "update subscribe" do
      email
      email.subscribed = false
      email.save
      expect {
        post "/emails", email: {email: email.email}
      }.to change { Email.count }.by(0)
      email.reload
      expect(email.subscribed).to eq(true)
    end
  end

  describe "#update" do
    it "redirect" do
      email
      expect {
        put "/emails", email: {email: email.email}
      }.to change { Email.subscribed.count }.by(-1)
    end
  end

  describe "#delete" do
    it "redirect" do
      email
      expect {
        delete "/emails", email: {email: email.email}
      }.to change { Email.count }.by(-1)
    end
  end
end