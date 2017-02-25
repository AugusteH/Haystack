class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :reference
      t.integer :address_id
      t.integer :client_id
      t.integer :total_payment_cents
      t.string :status

      t.timestamps
    end
  end
end
