class CreateConstituencies < ActiveRecord::Migration
  def change
    create_table :constituencies do |t|
      t.string :name
      t.integer :county_id
      t.string :kind
    end
  end
end
