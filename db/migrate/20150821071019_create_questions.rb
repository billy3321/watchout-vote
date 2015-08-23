class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :description
      t.text :content
      t.integer :issue_id

      t.timestamps null: false
    end
  end
end
