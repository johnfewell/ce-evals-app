class FinishedEvaluation < ApplicationRecord
  has_many :answers
  belongs_to :attendee
  belongs_to :evaluation
  belongs_to :course
  accepts_nested_attributes_for :answers
end
