class AddDetails < ActiveRecord::Migration[6.0]
  def change
    #change_column :users, :email, :string, unique: true
    add_column :products, :quantity, :integer
    add_column :products, :shipping_price, :integer
    add_column :vendors, :shipping_price, :integer
  end
end
