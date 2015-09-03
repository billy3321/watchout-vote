object @issues
node(:count) { |_| @issues_count }
child(:@issues) do
  attributes :id, :name, :description, :ngo, :ngo_link, :summary
  attributes image_url: :image
end
node(:status) {"success"}
