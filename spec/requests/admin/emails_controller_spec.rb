require "rails_helper"

describe "Admin/Email" do

  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:email) { FactoryGirl.create(:email) }


  describe "before login" do
    describe "#index" do
      it "redirect" do
        get "/admin/emails/"
        expect(response).to be_redirect
      end
    end

    describe "#index" do
      it "redirect" do
        get "/admin/emails/export"
        expect(response).to be_redirect
      end
    end
  end

  describe "after login" do
    before { sign_in(user) }
    after { sign_out }

    describe "#index" do
      it "redirect" do
        get "/admin/emails/"
        expect(response).to be_redirect
      end
    end

    describe "#index" do
      it "redirect" do
        get "/admin/emails/export"
        expect(response).to be_redirect
      end
    end
  end

  describe "after login admin" do
    before { sign_in(admin) }
    after { sign_out }

    describe "#index" do
      it "redirect" do
        get "/admin/emails/"
        expect(response).to be_success
      end
    end

    describe "#index" do
      it "redirect" do
        get "/admin/emails/export"
        expect(response).to be_success
      end
    end

  end
end