class AddMoreColumnsToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :locations, :json
    add_column :clients, :description, :text
    add_column :clients, :phone_numbers, :json
    add_column :clients, :emails, :json
    add_column :clients, :limitations, :text
    add_column :clients, :channels, :text
    add_column :clients, :pricing, :text
  end
end
