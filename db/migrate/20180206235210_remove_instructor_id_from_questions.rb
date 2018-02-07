class RemoveInstructorIdFromQuestions < ActiveRecord::Migration[5.1]
  def change
    remove_column :questions, :instructor_id, :integer
  end
end
