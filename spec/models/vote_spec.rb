require 'rails_helper'

RSpec.describe Vote, type: :model do
  it "#factory_create_success" do
    expect {
      FactoryGirl.create :vote
    }.to change { Vote.count }.by(1)
  end

  it "#factory_create_with_clarify_success" do
    expect {
      FactoryGirl.create :vote_with_clarify
    }.to change { Clarify.count }.by(1)
  end
end
