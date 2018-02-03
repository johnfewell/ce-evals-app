class Course < ApplicationRecord
  belongs_to :instructor
  has_many :course_attendees
  has_many :attendees, :through => :course_attendees
  has_one :evaluation
  has_many :finished_evaluations

  scope :complete, -> {
    where('end_date < ?', Date.today)
  }

  scope :not_complete, -> {
    where('end_date > ?', Date.today)
  }

  scope :upcoming, -> {
    where('start_date > ?', Date.today)
  }

  scope :started, -> {
    where('start_date <= ?', Date.today)
  }

  scope :published, -> {
    where('published == ?', true )
  }

  scope :unpublished, -> {
    where('published == ?', false )
  }

  validates :title, presence: true, length: { minimum: 2 }
  validates :location, presence: true, length: { minimum: 2 }
  validates :credits, presence: true
  validates :learning_objective_1, presence: true, length: { minimum: 10 }
  validates :start_date, presence: true
  validates :end_date, presence: true

  before_save :propercase_title

  def propercase_title
    self.title = self.title.titlecase
  end

  def complete?
    self.end_date < Date.today
  end

end
