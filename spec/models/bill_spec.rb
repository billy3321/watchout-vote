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

  # it "#date_asc_success" do
  #   bill1 = FactoryGirl.create :bill, created_at: 4.days.ago, date: 4.days.ago
  #   bill2 = FactoryGirl.create :bill, created_at: 3.days.ago, date: 2.days.ago
  #   bill3 = FactoryGirl.create :bill, created_at: 2.days.ago, date: 4.days.ago
  #   bill4 = FactoryGirl.create :bill, created_at: 1.days.ago, date: 2.days.ago
  #   expect(Bill.date_asc).to eq([bill2, bill4, bill1, bill3])
  # end

  # it "#date_desc_success" do
  #   bill1 = FactoryGirl.create :bill, created_at: 4.days.ago, date: 4.days.ago
  #   bill2 = FactoryGirl.create :bill, created_at: 3.days.ago, date: 2.days.ago
  #   bill3 = FactoryGirl.create :bill, created_at: 2.days.ago, date: 4.days.ago
  #   bill4 = FactoryGirl.create :bill, created_at: 1.days.ago, date: 2.days.ago
  #   expect(Bill.date_desc).to eq([bill3, bill1, bill4, bill2])
  # end

  it "#get_party_bill_success" do
    party = FactoryGirl.create :party
    issue = FactoryGirl.create :issue
    3.times do
      candidate = FactoryGirl.create :candidate, party: party
      3.times { FactoryGirl.create :bill, issue: issue, candidate: candidate }
    end
    expect(Bill.get_party_bill(party, issue).count).to eq(9)
  end

  it "#get_candidate_bill_success" do
    candidate = FactoryGirl.create :candidate
    issue = FactoryGirl.create :issue
    3.times { FactoryGirl.create :bill, issue: issue, candidate: candidate }
    expect(Bill.get_candidate_bill(candidate, issue).count).to eq(3)
  end

end





