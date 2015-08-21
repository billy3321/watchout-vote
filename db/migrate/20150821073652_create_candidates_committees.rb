class CreateCandidatesCommittees < ActiveRecord::Migration
  def change
    create_table :candidates_committees, id: false do |t|
      t.belongs_to :candidate
      t.belongs_to :committee
    end
    add_index :candidates_committees, [:candidate_id, :committee_id], unique: true
  end
end
