class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.integer :candidate_id
      t.string :image
      t.text :description
      t.string :alt
      t.date :date

      t.timestamps null: false
    end
  end
end
