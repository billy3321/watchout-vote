class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :image
      t.references :party, index: true, foreign_key: true
      t.string :gender
      t.integer :age
      t.text :education
      t.text :experience
      t.text :manifesto
      t.text :aimed_bill
      t.text :aimed_issue
      t.integer :legislator_no
      t.references :target, polymorphic: true, index: true
    end
  end
end
