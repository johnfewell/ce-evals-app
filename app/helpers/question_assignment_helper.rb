module QuestionAssignmentHelper
  def questions_by_instructor
    Question.where("instructor_id = ?", current_user.instructor.id)
  end
end
