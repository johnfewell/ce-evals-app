module FuntimesHelper

  def is_superadmin?
    current_user.superadmin_role
  end

  def is_attendee?
    current_user.attendee_role && current_user.attendee
  end

  def is_authorized?(resource)
    class_type = resource.class.to_s.downcase
    case
    when current_user.superadmin_role then true
    when class_type == "course"
      if current_user.instructor_role && current_user.instructor.id == resource.instructor_id
        true
      end
    when class_type == "instructor"
      if current_user.instructor_role && current_user.instructor.id == resource.id
        true
      end
    when class_type == "attendee"
      #
      if current_user.attendee_role && current_user.attendee.id == resource.id
        true
      elsif current_user.instructor_role
        c = resource.courses.find_by(:instructor_id => current_user.instructor.id)
        unless c.nil?
          if current_user.instructor.id == c.instructor_id
            true
          end
        end
      end
    when class_type == "evaluation"
      if resource.course == nil
        true
      elsif resource.course.instructor.id == current_user.instructor.id && current_user.instructor_role
        true
      end
    end
  end

end
