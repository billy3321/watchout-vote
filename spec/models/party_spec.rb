require "rails_helper"

describe Party do
  it "#factory_create_success" do
    expect {
      FactoryGirl.create :party
    }.to change { Party.count }.by(1)
  end

  it "#cannot delete with candidate" do
    candidate = FactoryGirl.create(:candidate)
    party = candidate.party
    expect {
      party.destroy
    }.to change { Party.count }.by(0)
  end
end