class CreateInterpellations < ActiveRecord::Migration
  def change
    create_table :interpellations do |t|
      t.integer :candidate_id
      t.integer :issue_id
      t.text :content
      t.text :summary
      t.string :detail
      t.string :decision
      t.string :url
      t.datetime :date
    end
  end
end
