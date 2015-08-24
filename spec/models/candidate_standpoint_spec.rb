require 'rails_helper'

RSpec.describe CandidateStandpoint, type: :model do
  it "#factory_create_success" do
    expect {
      FactoryGirl.create :candidate_standpoint
    }.to change { CandidateStandpoint.count }.by(1)
  end
end
