module HomePathHelper
  def home(user)
    if current_user.attendee_role
      attendee_path(user.attendee)
    elsif current_user.instructor_role
      instructor_path(user.instructor)
    else current_user.superadmin_role
      admin_path
    end
  end

  def profile(user)
    if current_user.attendee_role
      profile_attendee_path(user.attendee)
    elsif current_user.instructor_role
      profile_instructor_path(user.instructor)
    else current_user.superadmin_role
      admin_path
    end
  end
end
