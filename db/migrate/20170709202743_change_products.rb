class ChangeProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :price_tax_excluded, :integer
    change_column :products, :price_tax_included, :integer
    change_column :products, :tax_rate, :integer
    change_column :products, :compared_price, :integer
  end
end
