class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.integer :candidate_id
      t.integer :committee_id
      t.integer :issue_id
      t.text :content
      t.text :summary
      t.string :detail
      t.string :decision
      t.string :url
      t.date :date
      t.string :category

      t.timestamps null: false
    end
  end
end
