require 'rails_helper'

RSpec.describe District, :type => :model do
  it "#factory_create_success" do
    expect {
      FactoryGirl.create :district
    }.to change { District.count }.by(1)
  end
end
