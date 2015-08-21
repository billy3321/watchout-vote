class CreateDms < ActiveRecord::Migration
  def change
    create_table :dms do |t|
      t.string :name
      t.references :issue
      t.string :file
      t.string :image
    end
  end
end
