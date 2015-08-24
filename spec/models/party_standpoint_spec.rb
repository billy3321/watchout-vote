require 'rails_helper'

RSpec.describe PartyStandpoint, type: :model do
  it "#factory_create_success" do
    expect {
      FactoryGirl.create :party_standpoint
    }.to change { PartyStandpoint.count }.by(1)
  end
end
