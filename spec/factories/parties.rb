FactoryGirl.define do
  factory :party do
    sequence(:name)  { |n| "Party #{n}" }
    sequence(:short_name) { |n| "P #{n}" }
    sequence(:abbreviation)  { |n| "Pty_#{n}" }
    sequence(:experience)  { |n| "Party #{n} Experience" }
    sequence(:property)  { |n| "Party #{n} Property" }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg')) }
    background { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg')) }
  end
end
