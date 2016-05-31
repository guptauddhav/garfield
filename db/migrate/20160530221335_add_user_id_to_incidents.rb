class AddUserIdToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :user_id, :integer
    add_index :incidents, :user_id
  end
end
