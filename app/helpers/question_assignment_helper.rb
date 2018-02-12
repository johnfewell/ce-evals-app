module QuestionAssignmentHelper
  def questions_by_instructor
    if current_user.instructor_role?
      Question.where("instructor_id = ?", current_user.instructor.id)
    elsif current_user.superadmin_role?
      Question.all
    else
      []
    end
  end
end
