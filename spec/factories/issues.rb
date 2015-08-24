FactoryGirl.define do
  factory :issue do
    sequence(:name)  { |n| "Issue #{n}" }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg')) }
    sequence(:description) { |n| "Issue Description #{n}" }
    sequence(:ngo) { |n| "NGO #{n}" }
    ngo_link "http://www.google.com"
    published true
  end
end
