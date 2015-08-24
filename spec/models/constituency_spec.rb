require 'rails_helper'

RSpec.describe Constituency, type: :model do
  it "#factory_create_success" do
    expect {
      FactoryGirl.create :constituency
    }.to change { Constituency.count }.by(1)
  end

  it "#factory_create_with_county_success" do
    expect {
      FactoryGirl.create :constituency_with_county
    }.to change { County.count }.by(1)
  end
end
