class CreateCourseAttendees < ActiveRecord::Migration[5.1]
  def change
    create_table :course_attendees do |t|
      t.integer :attendee_id
      t.integer :course_id
    end
  end
end
