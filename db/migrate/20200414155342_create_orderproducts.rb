class CreateOrderproducts < ActiveRecord::Migration[6.0]
  def change
    create_table :orderproducts do |t|
      t.integer :quantity
      t.integer :price
      t.integer :order_id
      t.string :status

      t.timestamps
    end
  end
end

