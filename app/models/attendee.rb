class Attendee < ApplicationRecord
  require 'csv'
  has_many :course_attendees
  has_many :courses, :through => :course_attendees
  has_many :instructors, :through => :courses
  has_many :finished_evaluations

  def fullname
    "#{first_name} #{last_name}"
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Attendee.create! row.to_hash
    end
  end

end
