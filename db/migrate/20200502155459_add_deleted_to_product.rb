class AddDeletedToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :deleted, :boolean
  end
end
