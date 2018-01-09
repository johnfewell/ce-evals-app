class Instructor < ApplicationRecord
  has_many :courses
  has_many :attendees, :through => :courses
  belongs_to :user, optional: true

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }

  def fullname
    "#{first_name} #{last_name}"
  end

end
