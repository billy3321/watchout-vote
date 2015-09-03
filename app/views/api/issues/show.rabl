object false
child(:@issue) do
  attributes :id, :name, :description, :ngo, :ngo_link, :summary
  attributes image_url: :image
end
node(:status) {"success"}
