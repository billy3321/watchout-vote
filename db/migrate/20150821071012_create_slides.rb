class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.references :issue, index: true, foreign_key: true
      t.string :image
      t.string :alt
      t.integer :order
    end
  end
end
