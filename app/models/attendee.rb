class Attendee < ApplicationRecord
  has_many :course_attendees
  has_many :courses, :through => :course_attendees
  has_many :instructors, :through => :courses

end
