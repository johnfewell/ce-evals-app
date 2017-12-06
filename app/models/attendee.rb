class Attendee < ApplicationRecord
  require 'csv'
  has_many :course_attendees
  has_many :courses, :through => :course_attendees
  has_many :instructors, :through => :courses
  has_many :finished_evaluations

  def fullname
    "#{first_name} #{last_name}"
  end

  def incomplete_evaluations
    completed_courses = []
    incomplete_evaluations_array =[]
    self.courses.each do |c|
      if c.complete?
        completed_courses << c
      end
    end
    completed_courses.each do |cc|
      if cc.attendees.find(self.id)
        incomplete_evaluations_array << cc
      end
    end
    incomplete_evaluations_array
  end

  def self.import(file, course_id)
    CSV.foreach(file.path, headers: true) do |row|
      attendee = Attendee.new row.to_hash
      attendee.course_id = course_id
      attendee.save!
    end
  end
end
