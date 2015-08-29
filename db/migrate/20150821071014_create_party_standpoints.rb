class CreatePartyStandpoints < ActiveRecord::Migration
  def change
    create_table :party_standpoints do |t|
      t.integer :party_id
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
