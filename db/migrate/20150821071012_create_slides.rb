class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.integer :issue_id
      t.string :image
      t.string :alt
      t.integer :position
    end
  end
end
