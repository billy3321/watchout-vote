require "rails_helper"

describe Committee do
  it "#factory_create_success" do
    expect {
      FactoryGirl.create :committee
    }.to change { Committee.count }.by(1)
  end
end