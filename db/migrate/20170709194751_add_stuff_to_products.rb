class AddStuffToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :price_tax_excluded, :string
    add_column :products, :price_tax_included, :string
    add_column :products, :tax_rate, :string
    add_column :products, :compared_price, :string
    add_column :products, :sku, :string
    add_column :products, :barcode, :string
    add_column :products, :width, :string
    add_column :products, :height, :string
    add_column :products, :depth, :string
    add_column :products, :weight, :string
    add_column :products, :extra_shipping_fee, :string
  end
end
