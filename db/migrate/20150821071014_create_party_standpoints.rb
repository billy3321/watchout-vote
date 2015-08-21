class CreatePartyStandpoints < ActiveRecord::Migration
  def change
    create_table :party_standpoints do |t|
      t.references :party, index: true, foreign_key: true
      t.references :issue, index: true, foreign_key: true
      t.float :agree
      t.float :disagree
      t.float :abstain
      t.float :notvote
    end
  end
end
