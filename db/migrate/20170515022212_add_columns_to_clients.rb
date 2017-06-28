class AddColumnsToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :retailer, :boolean
    add_column :clients, :manufacturer, :boolean
    add_column :clients, :firstname, :string
    add_column :clients, :lastname, :string
    add_column :clients, :companyName, :string
    add_column :clients, :companyDetails, :string
  end
end
