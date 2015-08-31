class AddColumnsToInterviews < ActiveRecord::Migration
  def change
    add_column :interviews, :published, :boolean, default: false
    add_column :interviews, :position, :integer
    add_column :interviews, :title, :string
    add_column :interviews, :content, :text
  end
end
