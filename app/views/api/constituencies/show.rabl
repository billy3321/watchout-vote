object @constituency
child(:@constituency) do
  attributes :id, :name, :kind
  node(:county) { |c| c.county.name if c.county_id }
  child(:candidates) do
    attributes :id, :name
    attributes image_url: :image
    child(:party) do
      attributes :id, :name, :short_name, :abbreviation, :prediction
      attributes image_url: :image
      attributes background_url: :background
    end
  end
  child(:legislators) do
    attributes :id, :name
    attributes image_url: :image
    child(:party) do
      attributes :id, :name, :short_name, :abbreviation, :prediction
      attributes image_url: :image
      attributes background_url: :background
    end
  end
  child(:districts) do
    attributes :id, :name
  end
end
node(:status) {"success"}