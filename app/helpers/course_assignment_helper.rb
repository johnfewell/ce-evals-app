module CourseAssignmentHelper
  def unassigned_courses
    courses = []
    Course.all.each do |c|
      if is_authorized?(c) && Evaluation.find_by(:course_id => c.id) == nil
        courses << c
      end
    end
    courses
  end
end
