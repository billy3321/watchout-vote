object @party_standpoint
child(:@party_standpoint) do
  attributes :id, :agree, :disagree, :abstain, :notvote, :unknown, :decision
  child(:party) do
    attributes :id, :name, :short_name, :abbreviation, :prediction
    attributes image_url: :image
    attributes background_url: :background
  end
  child(:issue) do
    attributes :id, :name, :description, :summary
    attributes image_url: :image
  end
end
node(:status) {"success"}