class CreateVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :vendors do |t|
      t.integer :user_id
      t.string :name
      t.string :about

      t.timestamps
    end
  end
end
