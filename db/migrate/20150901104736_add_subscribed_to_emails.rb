class AddSubscribedToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :subscribed, :boolean, default: true
  end
end
