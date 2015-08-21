class CreateCandidateStandpoints < ActiveRecord::Migration
  def change
    create_table :candidate_standpoints do |t|
      t.references :candidate, index: true, foreign_key: true
      t.references :issue, index: true, foreign_key: true
      t.float :agree
      t.float :disagree
      t.float :abstain
      t.float :notvote
    end
  end
end
