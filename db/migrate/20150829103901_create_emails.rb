class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :email,              null: false, default: ""
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :delete_confirmation_token
      t.datetime :delete_confirmation_sent_at

      t.timestamps null: false
    end
    add_index :emails, :email,   unique: true
    add_index :emails, :confirmation_token,   unique: true
    add_index :emails, :delete_confirmation_token,   unique: true
  end
end
