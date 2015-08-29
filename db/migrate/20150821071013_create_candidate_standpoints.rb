class CreateCandidateStandpoints < ActiveRecord::Migration
  def change
    create_table :candidate_standpoints do |t|
      t.integer :candidate_id
      t.integer :issue_id
      t.integer :agree
      t.integer :disagree
      t.integer :abstain
      t.integer :notvote
      t.string :decision

      t.timestamps null: false
    end
  end
end
