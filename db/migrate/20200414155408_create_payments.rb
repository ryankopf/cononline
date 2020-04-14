class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.integer :order_id
      t.integer :vendor_id
      t.integer :amount
      t.string :method

      t.timestamps
    end
  end
end
