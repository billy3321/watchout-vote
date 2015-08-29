class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.string :short_name
      t.string :abbreviation
      t.string :image
      t.string :background
      t.integer :prediction, default: 0
      t.text :experience
      t.text :property

      t.timestamps null: false
    end
  end
end
