class Instructor < ApplicationRecord
  has_many :courses
  has_many :attendees, :through => :courses
  belongs_to :user, optional: true

  def fullname
    "#{first_name} #{last_name}"
  end

end
