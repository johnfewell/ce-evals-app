class Attendee < ApplicationRecord
  require 'csv'
  has_many :course_attendees
  has_many :courses, :through => :course_attendees
  has_many :instructors, :through => :courses
  has_many :finished_evaluations

  def fullname
    "#{first_name} #{last_name}"
  end
  #
  # def self.import(course, file)
  #   CSV.foreach(file.path, headers: true) do |row|
  #     course.attendee.create! row.to_hash
  #   end
  # end


  def self.import(file, course_id)
    CSV.foreach(file.path, headers: true) do |row|
      attendee = Attendee.new row.to_hash
      attendee.course_id = course_id
      attendee.save!
    end
  end
end
