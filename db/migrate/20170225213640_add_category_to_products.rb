class AddCategoryToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :category, :string
    add_column :products, :price_cents, :integer
    add_column :products, :quantity, :integer
    add_column :products, :active, :boolean, default: false
    remove_column :products, :price, :integer
  end
end
