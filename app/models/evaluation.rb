class Evaluation < ApplicationRecord
  has_many :questions
  belongs_to :course
  has_many :finished_evaluations
  accepts_nested_attributes_for :questions
end
