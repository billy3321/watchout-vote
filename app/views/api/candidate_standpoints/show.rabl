object @candidate_standpoint
child(:@candidate_standpoint) do
  attributes :id, :agree, :disagree, :abstain, :notvote, :unknown, :decision
  child(:candidate) do
    attributes :id, :name
    attributes image_url: :image
    child(:party) do
      attributes :id, :name, :short_name, :abbreviation, :prediction
      attributes image_url: :image
      attributes background_url: :background
    end
  end
  child(:issue) do
    attributes :id, :name, :description, :summary
    attributes image_url: :image
  end
end
node(:status) {"success"}