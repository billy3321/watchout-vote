require 'rails_helper'

RSpec.describe Candidate, type: :model do
  it "#factory_create_success" do
    expect {
      FactoryGirl.create :candidate
    }.to change { Candidate.count }.by(1)
  end

  it "#factory_create_eight_success" do
    expect {
      FactoryGirl.create :eight_candidate
    }.to change { Candidate.count }.by(1)
  end

  it "#factory_create_withdraw_success" do
    expect {
      FactoryGirl.create :withdraw_candidate
    }.to change { Candidate.count }.by(1)
  end
end
