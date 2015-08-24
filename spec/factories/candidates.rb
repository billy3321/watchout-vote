FactoryGirl.define do
  factory :candidate do
    sequence(:name)  { |n| "Candidate #{n}" }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg')) }
    party { FactoryGirl.create(:party) }
    gender { ["male", "female", "other"].sample }
    sequence(:age) { |n| n }
    sequence(:education) { |n| "Candidate Education #{n}" }
    sequence(:experience) { |n| "Candidate Experience #{n}" }
    sequence(:manifesto) { |n| "Candidate Manifesto #{n}" }
    sequence(:aimed_bill) { |n| "Candidate Aimed Bill #{n}" }
    sequence(:aimed_issue) { |n| "Candidate Aimed Issue #{n}" }
    nine true
    nine_constituency { FactoryGirl.create(:constituency) }
    sequence(:nine_position) { |n| n }
    sequence(:nine_number) { |n| n }
  end

  factory :eight_candidate, parent: :candidate do
    sequence(:legislator_no) { |n| n }
    committees { [FactoryGirl.create(:committee)] }
    eight true
    eight_constituency { FactoryGirl.create(:constituency) }
  end

  factory :withdraw_candidate, parent: :candidate do
    withdraw true
  end
end
