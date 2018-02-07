class AddInstructorIdToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :instructor_id, :integer
  end
end
