require 'rails_helper'

RSpec.describe Bill, type: :model do
  it "#factory_create_success" do
    expect {
      FactoryGirl.create :bill
    }.to change { Bill.count }.by(1)
  end

  it "#factory_create_with_clarify_success" do
    expect {
      FactoryGirl.create :bill_with_clarify
    }.to change { Clarify.count }.by(1)
  end
end
