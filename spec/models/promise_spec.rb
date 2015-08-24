require 'rails_helper'

RSpec.describe Promise, type: :model do
  it "#factory_create_success" do
    expect {
      FactoryGirl.create :promise
    }.to change { Promise.count }.by(1)
  end
end
