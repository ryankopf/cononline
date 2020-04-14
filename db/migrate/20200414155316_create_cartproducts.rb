class CreateCartproducts < ActiveRecord::Migration[6.0]
  def change
    create_table :cartproducts do |t|
      t.integer :quantity
      t.integer :cart_id
      t.integer :product_id

      t.timestamps
    end
  end
end
