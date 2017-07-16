class AddNewIntColumnsToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :price_tax_excluded, :integer
    add_column :products, :price_tax_included, :integer
    add_column :products, :tax_rate, :integer
    add_column :products, :compared_price, :integer
  end
end
