class CreatePromises < ActiveRecord::Migration
  def change
    create_table :promises do |t|
      t.references :candidate, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.text :answer
      t.text :summary
      t.string :detail
      t.string :decision
      t.datetime :date
    end
  end
end
