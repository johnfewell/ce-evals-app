class CreateAttendees < ActiveRecord::Migration[5.1]
  def change
    create_table :attendees do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :suffix
      t.timestamps
    end
  end
end
