class AddCourseToEvaluations < ActiveRecord::Migration[5.1]
  def change
    add_column :evaluations, :course_id, :integer
  end
end
