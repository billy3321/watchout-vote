class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.string :short_name
      t.string :abbreviation
      t.string :image
      t.string :background
      t.integer :prediction
    end
  end
end
