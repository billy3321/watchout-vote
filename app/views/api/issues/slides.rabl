object false
node(:count) { |_| @slides_count }
child(:@slides) do
  attributes :id, :alt, :position
  attributes image_url: :image
end
node(:status) {"success"}
