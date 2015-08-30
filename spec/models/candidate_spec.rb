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

  it "#with_interviews_success" do
    candidate1 = FactoryGirl.create :candidate
    candidate2 = FactoryGirl.create :candidate
    candidate3 = FactoryGirl.create :candidate
    candidate4 = FactoryGirl.create :candidate
    2.times { FactoryGirl.create :interview, candidate: candidate1 }
    2.times { FactoryGirl.create :interview, candidate: candidate2 }
    expect(Candidate.with_interviews.length).to eq(2)
  end
end

