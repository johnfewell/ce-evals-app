class Question < ApplicationRecord
  has_many :evaluation_questions
  has_many :evaluations, :through => :evaluation_questions
  has_many :answers
  has_many :attendees, :through => :answers
  belongs_to :instructor
  accepts_nested_attributes_for :answers
  validates_uniqueness_of :content
  validates :content, presence: true, length: { minimum: 2 }
end
