require 'rails_helper'

RSpec.describe County, :type => :model do
  it "#factory_create_success" do
    expect {
      FactoryGirl.create :county
    }.to change { County.count }.by(1)
  end
end
