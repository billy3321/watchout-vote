class CreateClarifies < ActiveRecord::Migration
  def change
    create_table :clarifies do |t|
      t.integer :record_id
      t.string :record_type
      t.text :content
      t.date :date

      t.timestamps null: false
    end
    add_index :clarifies, [:record_id, :record_type], unique: true
  end
end
