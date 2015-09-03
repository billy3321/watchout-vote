object false
node(:count) { |_| @interviews_count }
child(:@interviews) do
  attributes :id, :description, :date, :title, :position, :alt
  attributes image_url: :image
end
node(:status) {"success"}
