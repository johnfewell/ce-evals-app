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
      resource.id == current_user.instrucor.id
    elsif current_user.attendee
      resource.id == current_user.attendee.id
    else
      false
    end
  end

end
