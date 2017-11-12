class Course < ApplicationRecord
  belongs_to :instructor
  has_many :course_attendees
  has_many :attendees, :through => :course_attendees
end
