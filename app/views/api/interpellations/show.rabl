object @interpellation
child(:@interpellation) do
  attributes :id, :content, :summary, :decision, :url, :date, :category
  child(:candidate) do
    attributes :id, :name
    attributes image_url: :image
    node(:eight_constituency) { |c| c.eight_constituency.full_name if c.eight_constituency_id }
    node(:nine_constituency) { |c| c.nine_constituency.full_name if c.nine_constituency_id }
    child(:party) do
      attributes :id, :name, :short_name, :abbreviation, :prediction
      attributes image_url: :image
      attributes background_url: :background
    end
  end
  child(:committee) do
    attributes :id, :name
  end
  child(:clarify) do
    attributes :id, :content, :date, :url
  end
end
node(:status) {"success"}