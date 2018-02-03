module AuthorizedAttendeesHelper
  def authorized_attendees
    authorized_attendees = []
    @attendees.each do |a|
      if is_authorized?(a)
        authorized_attendees << a
      end
    end
    authorized_attendees
  end
end
