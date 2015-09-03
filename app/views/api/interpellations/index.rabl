object @interpellations
node(:count) { |_| @interpellations_count }
child(:@interpellations) do
  attributes :id, :content, :summary, :decision, :url, :date, :category
  child(:candidate) do
    attributes :id, :name
    attributes image_url: :image
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
