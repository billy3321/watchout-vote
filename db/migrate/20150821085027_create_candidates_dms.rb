class CreateCandidatesDms < ActiveRecord::Migration
  def change
    create_table :candidates_dms, id: false do |t|
      t.belongs_to :candidate
      t.belongs_to :dm
    end
    add_index :candidates_dms, [:candidate_id, :dm_id], unique: true
  end
end
