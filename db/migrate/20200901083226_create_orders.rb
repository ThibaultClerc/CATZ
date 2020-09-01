class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :item_name
      t.text :description
      t.integer :price
      t.integer :quantity
      t.string :payment_method
      t.string :client_name
      t.string :client_email

      t.timestamps
    end
  end
end
