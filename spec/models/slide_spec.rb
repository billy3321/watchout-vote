require 'rails_helper'

RSpec.describe Slide, type: :model do
  it "#factory_create_success" do
    expect {
      FactoryGirl.create :slide
    }.to change { Slide.count }.by(1)
  end

  it "#set_position" do
    issue = FactoryGirl.create(:issue)
    slide1 = FactoryGirl.create(:slide, issue: issue)
    slide2 = FactoryGirl.create(:slide, issue: issue)
    position_diff = slide2.position - slide1.position
    expect(position_diff).to eq(1)
  end
end
