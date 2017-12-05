class Course < ApplicationRecord
  belongs_to :instructor
  has_many :course_attendees
  has_many :attendees, :through => :course_attendees
  has_one :evaluation
  has_many :finished_evaluations

  before_save :propercase_title

  def propercase_title
    self.title = self.title.titlecase
  end

  def complete?
    self.end_date < Date.today 
  end

end
