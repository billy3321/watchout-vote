class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.references :candidate, index: true, foreign_key: true
      t.references :issue, index: true, foreign_key: true
      t.references :record, polymorphic: true, index: true
      t.text :content
      t.text :summary
      t.string :detail
      t.string :decision
      t.string :url
      t.datetime :date
    end
  end
end
