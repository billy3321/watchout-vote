require "rails_helper"

describe "Admin/StaticPages" do

  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }

  describe "before login" do
    describe "#home" do
      it "success" do
        get "/admin"
        expect(response).to be_redirect
      end
    end
  end
  describe "after login" do
    before { sign_in(user) }
    after { sign_out }

    describe "#home" do
      it "success" do
        get "/admin"
        expect(response).to be_redirect
      end
    end
  end

  describe "after admin login" do
    before { sign_in(admin) }
    after { sign_out }

    describe "#home has logout" do
      it "success" do
        get "/admin"
        expect(response).to be_success
        expect(response.body).to match("登出")
        expect(response.body).to match("後台")
      end
    end
  end
end
