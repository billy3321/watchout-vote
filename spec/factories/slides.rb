FactoryGirl.define do
  factory :slide do
    issue { FactoryGirl.create(:issue) }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg')) }
    sequence(:alt)  { |n| "Slide #{n}" }
  end
end
