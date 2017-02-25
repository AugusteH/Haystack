class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :street
      t.string :street_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone_number
      t.integer :client_id

      t.timestamps
    end
  end
end
