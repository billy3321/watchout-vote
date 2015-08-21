class CreateAdNineData < ActiveRecord::Migration
  def change
    create_table :ad_nine_data do |t|
      t.references :candidate, index: true, foreign_key: true
      t.references :constituency, index: true, foreign_key: true
      t.integer :order
      t.integer :number
    end
  end
end
