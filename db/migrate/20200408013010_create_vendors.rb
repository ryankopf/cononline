class CreateVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :vendors do |t|
      t.int :user_id
      t.string :name
      t.string :about

      t.timestamps
    end
  end
end
