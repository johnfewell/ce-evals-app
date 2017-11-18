class Instructor < ApplicationRecord
  has_many :courses
  has_many :attendees, :through => :courses

  def fullname
    "#{first_name} #{last_name}"
  end

end
