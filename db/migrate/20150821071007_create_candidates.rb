class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :image
      t.integer :party_id
      t.string :gender
      t.integer :age
      t.text :education
      t.text :experience
      t.text :manifesto
      t.text :aimed_bill
      t.text :aimed_issue
      t.integer :legislator_no
      t.boolean :withdraw, default: false
      t.boolean :eight, default: false
      t.integer :eight_constituency_id
      t.boolean :nine, default: false
      t.integer :nine_constituency_id
      t.integer :nine_position
      t.integer :nine_number
      t.integer :target, polymorphic: true

      t.timestamps null: false
    end
  end
end
