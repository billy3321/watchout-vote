class CreateCandidateStandpoints < ActiveRecord::Migration
  def change
    create_table :candidate_standpoints do |t|
      t.integer :candidate_id
      t.integer :issue_id
      t.float :agree
      t.float :disagree
      t.float :abstain
      t.float :notvote

      t.timestamps null: false
    end
  end
end
