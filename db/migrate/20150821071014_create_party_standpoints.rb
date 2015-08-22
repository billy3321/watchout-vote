class CreatePartyStandpoints < ActiveRecord::Migration
  def change
    create_table :party_standpoints do |t|
      t.integer :party_id
      t.integer :issue_id
      t.float :agree
      t.float :disagree
      t.float :abstain
      t.float :notvote
    end
  end
end
