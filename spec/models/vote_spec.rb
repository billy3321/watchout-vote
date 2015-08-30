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

  it "#date_asc_success" do
    vote1 = FactoryGirl.create :vote, created_at: 4.days.ago, date: 4.days.ago
    vote2 = FactoryGirl.create :vote, created_at: 3.days.ago, date: 2.days.ago
    vote3 = FactoryGirl.create :vote, created_at: 2.days.ago, date: 4.days.ago
    vote4 = FactoryGirl.create :vote, created_at: 1.days.ago, date: 2.days.ago
    expect(Vote.date_asc).to eq([vote1, vote3, vote2, vote4])
  end

  it "#date_desc_success" do
    vote1 = FactoryGirl.create :vote, created_at: 4.days.ago, date: 4.days.ago
    vote2 = FactoryGirl.create :vote, created_at: 3.days.ago, date: 2.days.ago
    vote3 = FactoryGirl.create :vote, created_at: 2.days.ago, date: 4.days.ago
    vote4 = FactoryGirl.create :vote, created_at: 1.days.ago, date: 2.days.ago
    expect(Vote.date_desc).to eq([vote4, vote2, vote3, vote1])
  end

  it "#get_party_vote_success" do
    party = FactoryGirl.create :party
    issue = FactoryGirl.create :issue
    3.times do
      candidate = FactoryGirl.create :candidate, party: party
      3.times { FactoryGirl.create :vote, issue: issue, candidate: candidate }
    end
    expect(Vote.get_party_vote(party, issue).count).to eq(9)
  end

  it "#get_candidate_vote_success" do
    candidate = FactoryGirl.create :candidate
    issue = FactoryGirl.create :issue
    3.times { FactoryGirl.create :vote, issue: issue, candidate: candidate }
    expect(Vote.get_candidate_vote(candidate, issue).count).to eq(3)
  end

end





