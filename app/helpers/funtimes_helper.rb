module FuntimesHelper

  def is_superadmin?
    current_user.superadmin_role
  end

  def is_attendee?
    current_user.attendee_role && current_user.attendee
  end

  def is_authorized?(resource)
    if current_user.superadmin_role
      true
    elsif current_user.instructor
      resource.id == current_user.instructor.id
    elsif current_user.attendee
      # !!! This breaks if the resouce id happens to match the attendee id, just by luck
      resource.id == current_user.attendee.id
    else
      false
    end
  end

end
