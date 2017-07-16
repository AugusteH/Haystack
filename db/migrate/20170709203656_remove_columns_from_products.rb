class RemoveColumnsFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :price_tax_excluded, :string
    remove_column :products, :price_tax_included, :string
    remove_column :products, :tax_rate, :string
    remove_column :products, :compared_price, :string
  end
end
