class CreateAdEightData < ActiveRecord::Migration
  def change
    create_table :ad_eight_data do |t|
      t.references :candidate, index: true, foreign_key: true
      t.references :constituency, index: true, foreign_key: true
    end
  end
end
