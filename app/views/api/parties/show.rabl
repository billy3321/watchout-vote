object false
child(:@party) do
  attributes :id, :name, :short_name, :abbreviation, :prediction, :experience, :property
  attributes image_url: :image
  attributes background_url: :background
end
node(:status) {"success"}
