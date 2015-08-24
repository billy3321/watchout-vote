require 'rails_helper'

RSpec.describe Question, type: :model do
  it "#factory_create_success" do
    expect {
      FactoryGirl.create :question
    }.to change { Question.count }.by(1)
  end

  it "#cannot delete with promise" do
    promise = FactoryGirl.create(:promise)
    question = promise.question
    expect {
      question.destroy
    }.to change { Question.count }.by(0)
  end
end


