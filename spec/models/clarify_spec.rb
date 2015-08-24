require 'rails_helper'

RSpec.describe Clarify, type: :model do
  it "#factory_create_bill_clarify_success" do
    expect {
      FactoryGirl.create :bill_clarify
    }.to change { Clarify.count }.by(1)
  end

  it "#factory_create_interpellation_clarify_success" do
    expect {
      FactoryGirl.create :interpellation_clarify
    }.to change { Clarify.count }.by(1)
  end

  it "#factory_create_vote_clarify_success" do
    expect {
      FactoryGirl.create :vote_clarify
    }.to change { Clarify.count }.by(1)
  end
end
