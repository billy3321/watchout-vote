require 'rails_helper'

RSpec.describe Interpellation, type: :model do
  it "#factory_create_success" do
    expect {
      FactoryGirl.create :interpellation
    }.to change { Interpellation.count }.by(1)
  end

  it "#factory_create_with_clarify_success" do
    expect {
      FactoryGirl.create :interpellation_with_clarify
    }.to change { Clarify.count }.by(1)
  end

  it "#date_asc_success" do
    interpellation1 = FactoryGirl.create :interpellation, created_at: 4.days.ago, date: 4.days.ago
    interpellation2 = FactoryGirl.create :interpellation, created_at: 3.days.ago, date: 2.days.ago
    interpellation3 = FactoryGirl.create :interpellation, created_at: 2.days.ago, date: 4.days.ago
    interpellation4 = FactoryGirl.create :interpellation, created_at: 1.days.ago, date: 2.days.ago
    expect(Interpellation.date_asc).to eq([interpellation1, interpellation3, interpellation2, interpellation4])
  end

  it "#date_desc_success" do
    interpellation1 = FactoryGirl.create :interpellation, created_at: 4.days.ago, date: 4.days.ago
    interpellation2 = FactoryGirl.create :interpellation, created_at: 3.days.ago, date: 2.days.ago
    interpellation3 = FactoryGirl.create :interpellation, created_at: 2.days.ago, date: 4.days.ago
    interpellation4 = FactoryGirl.create :interpellation, created_at: 1.days.ago, date: 2.days.ago
    expect(Interpellation.date_desc).to eq([interpellation4, interpellation2, interpellation3, interpellation1])
  end

  it "#get_party_interpellation_success" do
    party = FactoryGirl.create :party
    issue = FactoryGirl.create :issue
    3.times do
      candidate = FactoryGirl.create :candidate, party: party
      3.times { FactoryGirl.create :interpellation, issue: issue, candidate: candidate }
    end
    expect(Interpellation.get_party_interpellation(party, issue).count).to eq(9)
  end

  it "#get_candidate_interpellation_success" do
    candidate = FactoryGirl.create :candidate
    issue = FactoryGirl.create :issue
    3.times { FactoryGirl.create :interpellation, issue: issue, candidate: candidate }
    expect(Interpellation.get_candidate_interpellation(candidate, issue).count).to eq(3)
  end

end





