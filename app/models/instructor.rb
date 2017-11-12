class Instructor < ApplicationRecord
  has_many :courses
  has_many :attendees, :through => :courses

end
