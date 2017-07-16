class ChangeColumnsInProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :price_tax_excluded, :decimal, precision: 5, scale: 2
    change_column :products, :price_tax_included, :decimal, precision: 5, scale: 2
    change_column :products, :tax_rate, :decimal, precision: 5, scale: 2
    change_column :products, :price_cents, :decimal, precision: 5, scale: 2

  end
end
