class CreateAttendees < ActiveRecord::Migration[6.0]
  def change
    create_table :attendees do |t|
      t.integer :user_id
      t.string :name
      t.string :about
      t.boolean :public

      t.timestamps
    end
  end
end
