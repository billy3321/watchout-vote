class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.references :candidate, index: true, foreign_key: true
      t.string :image
      t.text :description
      t.string :alt
    end
  end
end
