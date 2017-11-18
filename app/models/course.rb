class Course < ApplicationRecord
  belongs_to :instructor
  has_many :course_attendees
  has_many :attendees, :through => :course_attendees
  has_one :evaluation
  has_many :finished_evaluations
end
