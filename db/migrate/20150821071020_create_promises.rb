class CreatePromises < ActiveRecord::Migration
  def change
    create_table :promises do |t|
      t.integer :candidate_id
      t.integer :question_id
      t.text :answer
      t.text :summary
      t.string :detail
      t.string :decision
      t.datetime :date
    end
  end
end
