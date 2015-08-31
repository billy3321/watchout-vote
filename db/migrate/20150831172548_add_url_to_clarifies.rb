class AddUrlToClarifies < ActiveRecord::Migration
  def change
    add_column :clarifies, :url, :string
  end
end
