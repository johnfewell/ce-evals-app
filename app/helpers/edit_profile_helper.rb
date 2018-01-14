module EditProfileHelper
  def profile(user)
    if current_user.attendee_role
      attendee_url(user.attendee)
    elsif current_user.instructor_role
      instructor_url(user.instructor)
    elsif current_user.superadmin_role
      root_url
    else
      root_url
    end
  end
end
