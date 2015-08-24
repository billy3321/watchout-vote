require 'rails_helper'

RSpec.describe Interview, type: :model do
  it "#factory_create_success" do
    expect {
      FactoryGirl.create :interview
    }.to change { Interview.count }.by(1)
  end
end
