class Attendee < ApplicationRecord
  require 'csv'
  has_many :course_attendees
  has_many :courses, :through => :course_attendees
  has_many :instructors, :through => :courses
  has_many :finished_evaluations
  belongs_to :user, optional: true

  rating as: :author


  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }


  def fullname
    "#{first_name} #{last_name}"
  end

  def incomplete_evaluations
    completed_courses = []
    incomplete_evaluations_array = []
    self.courses.each do |course|
      if course.complete?
        completed_courses << course
      end
    end

    completed_courses.each do |completed_course|
      if completed_course.finished_evaluations.empty?
        incomplete_evaluations_array << completed_course
      else
        completed_course.finished_evaluations do |completed_course_finished_evaluation|
          if !completed_course_finished_evaluation.attendee_id.find(self.id)
            incomplete_evaluations_array << completed_course
          end
        end
      end
    end
    incomplete_evaluations_array
  end

  def self.import(file, course)
    CSV.foreach(file.path, headers: true) do |row|
      attendee = Attendee.new row.to_hash
      attendee.courses << course
      attendee.save!
    end
  end
end
