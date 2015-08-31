FactoryGirl.define do
  factory :interview do
    candidate { FactoryGirl.create(:candidate) }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg')) }
    sequence(:description) { |n| "Interview Description #{n}" }
    alt "alt"
    published true
    sequence(:date) { |n| n.days.ago }
  end

end
