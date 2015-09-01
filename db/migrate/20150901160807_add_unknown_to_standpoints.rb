class AddUnknownToStandpoints < ActiveRecord::Migration
  def change
    add_column :party_standpoints, :unknown, :integer
    add_column :candidate_standpoints, :unknown, :integer
  end
end
