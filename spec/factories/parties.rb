FactoryGirl.define do
  factory :party do
    sequence(:name)  { |n| "Party #{n}" }
    sequence(:short_name) { |n| "P #{n}" }
    sequence(:abbreviation)  { |n| "Pty_#{n}" }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg')) }
    background { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg')) }
  end
end
