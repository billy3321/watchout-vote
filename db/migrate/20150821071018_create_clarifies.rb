class CreateClarifies < ActiveRecord::Migration
  def change
    create_table :clarifies do |t|
      t.integer :record_id
      t.string :record_type
      t.text :content
      t.datetime :date
    end
    add_index :clarifies, :record_id
  end
end
