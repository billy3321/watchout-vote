class CreateDms < ActiveRecord::Migration
  def change
    create_table :dms do |t|
      t.string :name
      t.integer :issue_id
      t.string :file
      t.string :image
    end
  end
end
