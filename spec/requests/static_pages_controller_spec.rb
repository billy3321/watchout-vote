require "rails_helper"

describe "Static pages" do

  describe "#home" do
    it "success" do
      get "/"
      expect(response).to be_success
    end
  end

  describe "#about" do
    it "success" do
      get "/about"
      expect(response).to be_success
    end
  end
end
