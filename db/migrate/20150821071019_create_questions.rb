class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      t.references :issue, index: true, foreign_key: true
    end
  end
end
