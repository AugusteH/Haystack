class AddColumnsToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :subcategory, :string
    add_column :products, :distribution, :text
    add_column :products, :unique_selling_propositions, :text
    add_column :products, :distribution_limitations, :text
    add_column :products, :distribution_channels, :text
    add_column :products, :drop_ship_capability, :boolean
    add_column :products, :approvals_certifications, :json
    add_column :products, :private_label_capability, :string
    add_column :products, :target_audience, :text
    add_column :products, :company_name, :string
  end
end
