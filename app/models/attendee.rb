class Attendee < ApplicationRecord
  has_many :course_attendees
  has_many :courses, :through => :course_attendees
  has_many :instructors, :through => :courses
  has_many :finished_evaluations

  def fullname
    "#{first_name} #{last_name}"
  end

end
