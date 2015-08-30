require 'rails_helper'

RSpec.describe Email, type: :model do
  it "#factory_create_success" do
    expect {
      FactoryGirl.create :email
    }.to change { Email.count }.by(1)
  end

  it "#wont_create_duplicate" do
    FactoryGirl.create :email, email: "test@test.com"
    email = FactoryGirl.build :email, email: "Test@Test.com"
    expect {
      email.save!
    }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
