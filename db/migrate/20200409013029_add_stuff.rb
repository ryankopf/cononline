class AddStuff < ActiveRecord::Migration[6.0]
  def change
    add_column :vendors, :website_url, :string
  end
end
