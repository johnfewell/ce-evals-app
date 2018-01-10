module EditProfileHelper
  def edit_profile(user)
    if current_user.attendee_role
      edit_attendee_url(user.attendee)
    elsif current_user.instructor_role
      edit_instructor_url(user.instructor)
    elsif current_user.superadmin_role
      root_url
    else
      root_url
    end
  end
end
