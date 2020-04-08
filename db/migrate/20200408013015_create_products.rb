class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :vendor_id
      t.string :name
      t.string :about

      t.timestamps
    end
  end
end
