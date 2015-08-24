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
end
