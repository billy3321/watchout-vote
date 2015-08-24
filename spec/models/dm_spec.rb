require 'rails_helper'

RSpec.describe Dm, type: :model do
  it "#factory_create_success" do
    expect {
      FactoryGirl.create :dm
    }.to change { Dm.count }.by(1)
  end
end
