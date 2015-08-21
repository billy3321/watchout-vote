class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :name
      t.string :image
      t.text :description
      t.string :ngo
      t.string :ngo_link
      t.boolean :published, default: false
    end
  end
end
