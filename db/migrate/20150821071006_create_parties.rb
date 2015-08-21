class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.string :abbreviation
      t.string :image
      t.integer :prediction
      t.references :target, polymorphic: true, index: true
    end
  end
end
