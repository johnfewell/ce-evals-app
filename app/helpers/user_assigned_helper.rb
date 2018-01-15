module UserAssignedHelper
  def user_assigned?(user)
    if Attendee.find_by(:user_id => user.id)
     true
   elsif Instructor.find_by(:user_id => user.id)
     true
   else
     false
   end
  end
end
