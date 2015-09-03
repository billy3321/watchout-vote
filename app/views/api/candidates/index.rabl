object @candidates
node(:count) { |_| @candidates_count }
child(:@candidates) do
  attributes :id, :name, :gender, :age, :experience,
    :manifesto, :aimed_issue, :aimed_bill, :legislator_no,
    :withdraw, :eight, :nine, :nine_position, :nine_number
  attributes image_url: :image
  node(:eight_constituency) { |c| c.eight_constituency.full_name if c.eight_constituency_id }
  node(:nine_constituency) { |c| c.nine_constituency.full_name if c.nine_constituency_id }
  child(:party) do
    attributes :id, :name, :short_name, :abbreviation, :prediction
    attributes image_url: :image
    attributes background_url: :background
  end
end
node(:status) {"success"}
