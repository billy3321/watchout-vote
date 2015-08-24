FactoryGirl.define do
  factory :dm do
    sequence(:name) { |n| "DM #{n}" }
    issue { FactoryGirl.create(:issue) }
    file "http://www.google.com"
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg')) }
  end

  factory :candidate_dm, parent: :dm do
    target { FactoryGirl.create(:candidate) }
  end

  factory :party_dm, parent: :dm do
    target { FactoryGirl.create(:party) }
  end
end
