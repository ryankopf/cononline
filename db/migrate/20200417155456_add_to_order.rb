class AddToOrder < ActiveRecord::Migration[6.0]
  def change
    #change_column :users, :email, :string, unique: true
    add_column :orders, :vendor_id, :integer
    add_column :orderproducts, :amount_shipped, :integer
  end
end
