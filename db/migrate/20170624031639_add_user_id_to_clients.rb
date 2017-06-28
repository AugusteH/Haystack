class AddUserIdToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :user_id, :integer, :null => false
  end
end
