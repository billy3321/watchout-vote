class CreateDmsParties < ActiveRecord::Migration
  def change
    create_table :dms_parties, id: false do |t|
      t.belongs_to :dm
      t.belongs_to :party
    end
    add_index :dms_parties, [:dm_id, :party_id], unique: true
  end
end
