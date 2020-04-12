class ChangeEmail < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :email, :string, unique: true
    add_column :users, :email_verified, :boolean
  end
end
