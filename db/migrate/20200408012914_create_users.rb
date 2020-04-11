class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :key
      t.datetime :key_made_at
      t.boolean :is_admin
      t.string :token
      t.datetime :token_made_at

      t.timestamps
    end
  end
end
